package com.ai.models;

import java.util.ArrayList;
import java.util.Date;

public class PautaXExcesoDevolucion extends Pauta {

	public PautaXExcesoDevolucion() {
		super();
	}
	
	//gonzalo

	@Override
	public ArrayList<ItemColocacion> procesarColocaciones(
			ArrayList<Puesto> puestos, int totalEjemplares, int idPublicacion,
			int idEdicion) {

		ArrayList <ItemColocacion> arrayColocacionesGeneradas = new ArrayList<ItemColocacion>();
		ItemColocacion colocacionAnterior;
		ItemColocacion nuevaColocacion;
		int particionEjemplares;
		int descuento ;
		for (Puesto puesto : puestos){
			colocacionAnterior = ReporteColocacion.getInstance().getUltimaColocacion(puesto.getCodigo(), idPublicacion);
			descuento = descuentoTablaPorExceso(colocacionAnterior.getCantidadEjemplares(), colocacionAnterior.getCantidadDevoluciones());

			
			particionEjemplares = colocacionAnterior.getCantidadEjemplares()-descuento;
			nuevaColocacion = new ItemColocacion(puesto.getCodigo(), particionEjemplares, 0, idEdicion, idPublicacion, new Date());

			this.setEjemplaresNecesarios(this.getEjemplaresNecesarios()+particionEjemplares);
			arrayColocacionesGeneradas.add(nuevaColocacion);
		}
		return arrayColocacionesGeneradas;
	}
	
	private int descuentoTablaPorExceso(int totalEmplares, int nroDevoluciones){
		/*
		 * Se debe implementar la tabla por exceso. Este calculo es temporal.
		 */
		int diferencia = nroDevoluciones-totalEmplares;
		int descuento = 0;
		if (diferencia > 0){
			float porcentaje = diferencia/totalEmplares;
			if (porcentaje < 10){
				descuento = Math.round(diferencia*porcentaje);
			}else if (porcentaje <25){
				descuento = (int) (diferencia - Math.round(diferencia*0.2)) ;
			}else if (porcentaje < 50){
				descuento = (int) (diferencia - Math.round(diferencia*0.1));
			}else {
				descuento = diferencia;
			}
			
		}
		return descuento;
		
	}
	


}

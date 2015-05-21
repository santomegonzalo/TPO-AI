USE [AplicacionesInteractivas]
GO
/****** Object:  Table [dbo].[Colocaciones]    Script Date: 5/21/2015 2:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colocaciones](
	[idColocacion] [int] IDENTITY(1,1) NOT NULL,
	[idEdicion] [int] NOT NULL,
	[pauta] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Colocaciones] PRIMARY KEY CLUSTERED 
(
	[idColocacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ediciones]    Script Date: 5/21/2015 2:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ediciones](
	[idEdicion] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NOT NULL,
	[tituloTapa] [varchar](500) NOT NULL,
	[precio] [float] NOT NULL,
	[fechaSalida] [date] NOT NULL,
 CONSTRAINT [PK_Ediciones_1] PRIMARY KEY CLUSTERED 
(
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemsColocaciones]    Script Date: 5/21/2015 2:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsColocaciones](
	[idItemColocacion] [int] IDENTITY(1,1) NOT NULL,
	[idPuesto] [int] NOT NULL,
	[totalEjemplaresEntregados] [int] NOT NULL,
	[totalEjemplaresDevueltos] [int] NOT NULL,
 CONSTRAINT [PK_ItemsColocaciones_1] PRIMARY KEY CLUSTERED 
(
	[idItemColocacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publicaciones]    Script Date: 5/21/2015 2:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publicaciones](
	[idPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](500) NOT NULL,
	[tituloPublicacion] [varchar](500) NOT NULL,
	[editor] [varchar](255) NOT NULL,
	[tema] [varchar](255) NOT NULL,
	[subtema] [varchar](255) NOT NULL,
	[publico] [char](1) NOT NULL,
	[periodicidad] [varchar](50) NOT NULL,
	[idioma] [varchar](50) NOT NULL,
	[paisOrigen] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Publicaciones_1] PRIMARY KEY CLUSTERED 
(
	[idPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 5/21/2015 2:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Puestos](
	[idPuesto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[barrio] [varchar](255) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[idZona] [int] NOT NULL,
 CONSTRAINT [PK_Puestos_1] PRIMARY KEY CLUSTERED 
(
	[idPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Puestos] ON 

INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (1, N'Gonzalo', N'Gaona 1830', N'Caballito', N'diario', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (2, N'Carlos', N'Paysandu 1020', N'Caballito', N'diario', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (3, N'Alberto', N'Monroe 1980', N'Belgrano', N'revista', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (4, N'Oscar', N'Libertados 1000', N'Belgrano', N'diario', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (5, N'Matias', N'Cordoba 1020', N'Palermo', N'revista', 1)
SET IDENTITY_INSERT [dbo].[Puestos] OFF
ALTER TABLE [dbo].[Colocaciones] ADD  CONSTRAINT [DF_Colocaciones_pauta_1]  DEFAULT ('default') FOR [pauta]
GO
ALTER TABLE [dbo].[ItemsColocaciones] ADD  CONSTRAINT [DF_ItemsColocaciones_totalEjemplaresEntregados]  DEFAULT ((0)) FOR [totalEjemplaresEntregados]
GO
ALTER TABLE [dbo].[ItemsColocaciones] ADD  CONSTRAINT [DF_ItemsColocaciones_totalEjemplaresDevueltos]  DEFAULT ((0)) FOR [totalEjemplaresDevueltos]
GO
ALTER TABLE [dbo].[Colocaciones]  WITH CHECK ADD  CONSTRAINT [FK_Colocaciones_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[Colocaciones] CHECK CONSTRAINT [FK_Colocaciones_Ediciones]
GO
ALTER TABLE [dbo].[Ediciones]  WITH CHECK ADD  CONSTRAINT [FK_Ediciones_Publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[Ediciones] CHECK CONSTRAINT [FK_Ediciones_Publicaciones]
GO
ALTER TABLE [dbo].[ItemsColocaciones]  WITH CHECK ADD  CONSTRAINT [FK_ItemsColocaciones_Puestos] FOREIGN KEY([idPuesto])
REFERENCES [dbo].[Puestos] ([idPuesto])
GO
ALTER TABLE [dbo].[ItemsColocaciones] CHECK CONSTRAINT [FK_ItemsColocaciones_Puestos]
GO

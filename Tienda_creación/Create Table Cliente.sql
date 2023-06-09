USE [Facturas2.0]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 25/04/2023 18:38:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cliente](
	[dni] [varchar](10) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[email] [varchar](25) NULL,
	[edad] [tinyint] NULL,
	[direcci�n] [varchar](40) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Cliente] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_edad_mayor_cero] CHECK  (([edad]>(0)))
GO

ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_edad_mayor_cero]
GO

USE [QL_BANHANG]
GO
BEGIN TRANSACTION
CREATE PARTITION FUNCTION [PART_F_DGCN](datetime) AS RANGE RIGHT FOR VALUES (N'2022-01-01T00:00:00', N'2023-01-01T00:00:00', N'2024-01-01T00:00:00')


CREATE PARTITION SCHEME [PART_S_DGCN] AS PARTITION [PART_F_DGCN] TO ([NLDGCN_2021], [NLDGCN_2022], [NLDGCN_2023], [PRIMARY])






ALTER TABLE [dbo].[DANHGIA_CHINHANH] DROP CONSTRAINT [PK__DANHGIA___603F00472EEC3544] WITH ( ONLINE = OFF )


SET ANSI_PADDING ON

ALTER TABLE [dbo].[DANHGIA_CHINHANH] ADD PRIMARY KEY NONCLUSTERED 
(
	[MADH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


CREATE CLUSTERED INDEX [ClusteredIndex_on_PART_S_DGCN_638073183461933639] ON [dbo].[DANHGIA_CHINHANH]
(
	[NGAYLAP]
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PART_S_DGCN]([NGAYLAP])


DROP INDEX [ClusteredIndex_on_PART_S_DGCN_638073183461933639] ON [dbo].[DANHGIA_CHINHANH]








COMMIT TRANSACTION



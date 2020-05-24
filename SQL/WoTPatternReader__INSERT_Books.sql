USE WotPatternReader;
GO

INSERT INTO dbo.Book (
	BookTitle
	,BookNumber
	,Abbreviation
	,IsNotMainline
)
VALUES 
('The Eye of the World', 1, 'TEotW', 0)
,('The Great Hunt', 2, 'TGH', 0)
,('The Dragon Reborn', 3, 'TDR', 0)
,('The Shadow Rising', 4, 'TSR', 0)
,('The Fires of Heaven', 5, 'TFoH', 0)
,('Lord of Chaos', 6, 'LoC', 0)
,('A Crown of Swords', 7, 'ACoS', 0)
,('The Path of Daggers', 8, 'TPoD', 0)
,('Winter''s Heart', 9, 'WH', 0)
,('Crossroads of Twilight', 10, 'CoT', 0)
,('Knife of Dreams', 11, 'KoD', 0)
,('The Gathering Storm', 12, 'TGS', 0)
,('Towers of Midnight', 13, 'ToM', 0)
,('A Memory of Light', 14, 'AMoL', 0)
,('The Strike at Shayol Ghul', NULL, 'SaSG', 1)
,('New Spring: The Novel', NULL, 'NS', 1)
,('River of Souls', NULL, 'RoS', 1)
,('The World of Robert Jordan''s The Wheel of Time', NULL, 'BWB', 1)
;
GO
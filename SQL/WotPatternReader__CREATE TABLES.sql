USE WotPatternReader;
GO

CREATE TABLE dbo.Book (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,BookTitle varchar(256) NOT NULL
	,BookNumber int NULL
	,Abbreviation varchar(12) NOT NULL
	,IsNotMainline bit DEFAULT 0-- (for BWB, new spring; UI can have option to include non-mainline texts in results.)
	,Synopsis varchar(max) NULL --some books will not have these, mostyl the BWB
);
GO

CREATE TABLE dbo.ChapterIcon (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,ChapterIcon varchar(256) NOT NULL
);
GO

CREATE TABLE dbo.Chapter (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,BookId int NOT NULL FOREIGN KEY REFERENCES dbo.Book(Id)
	,ChapterName varchar(256) NOT NULL
	,ChapterNumber int					--make nullable to better support prologue and epilogue
	,ChapterIconId int FOREIGN KEY REFERENCES dbo.ChapterIcon(Id)
	,IsPrologue bit NOT NULL DEFAULT 0
	,IsEpilogue bit NOT NULL DEFAULT 0
);
GO

CREATE TABLE dbo.Player (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,PlayerName varchar(256)
);
GO

CREATE TABLE dbo.PlayerAlias (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,PlayerId int NOT NULL FOREIGN KEY REFERENCES dbo.Player(Id)
	,PlayerAliasName varchar(256) NOT NULL
);
GO

CREATE TABLE dbo.PlayerDetail (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,PlayerId int NOT NULL FOREIGN KEY REFERENCES dbo.Player(Id)
	,ChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.Chapter(Id) --make nullable?  would null indicate starting detail then?
	,PlayerDetailDescription varchar(MAX) NOT NULL
);
GO

CREATE TABLE dbo.Organization (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,OrganizationName varchar(512) NOT NULL		--(Children of the Light)
	,OrganizationAlternateName varchar(512)		-- (whitecloaks)
);
GO

CREATE TABLE dbo.OrganizationDetail (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,OrganizationId int NOT NULL FOREIGN KEY REFERENCES dbo.Organization(Id)
	,ChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.Chapter(Id) --any benefit to making this nullable? would null indicate starting detail then?
	,OrganizationDetailDescription varchar(MAX) NOT NULL
);
GO

--think this needs to be PlayerOrganizationChapter, since players may join or leave organizations over th course of the series - do we need both bridges?  not sure...
--CREATE TABLE dbo.PlayerOrganization (
--	PlayerId int NOT NULL FOREIGN KEY REFERENCES dbo.Player(Id)
--	,OrganizationId int NOT NULL FOREIGN KEY REFERENCES dbo.Organization(Id)
--);
--GO
CREATE TABLE dbo.PlayerOrganizationChapter (
	PlayerId int NOT NULL FOREIGN KEY REFERENCES dbo.Player(Id)
	,OrganizationId int NOT NULL FOREIGN KEY REFERENCES dbo.Organization(Id)
	,ChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.Chapter(Id)
);
GO

CREATE TABLE dbo.ProphecyType (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,ProphecyTypeName varchar(256)
);
GO

CREATE TABLE dbo.Prophecy (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,ChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.Chapter(Id)					--(or book?  both?  --some prophecies are only bumpers for books, such as the Karaethon cycle - tag these as end?)
	,ProphecyTypeId int NOT NULL FOREIGN KEY REFERENCES dbo.ProphecyType(Id)
	,ProphecyDescription varchar(MAX) NOT NULL		--		(twice and twice shall he be marked)
);
GO

CREATE TABLE dbo.ProphecyPlayerChapter (
	ProphecyId int NOT NULL FOREIGN KEY REFERENCES dbo.Prophecy(Id)
	,PlayerId int NOT NULL FOREIGN KEY REFERENCES dbo.Player(Id)
	,ChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.Chapter(Id)
);
GO

CREATE TABLE dbo.Country (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,CountryName varchar(256) NOT NULL
);
GO

CREATE TABLE dbo.Location (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,CountryId int FOREIGN KEY REFERENCES dbo.Country(Id)	 --(can be null) (can tie in to country but also may include locations that do not have a country)
	,LocationName varchar(256) NOT NULL
);
GO

CREATE TABLE dbo.Episode (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,EpisodeName varchar(256) NOT NULL
);
GO

CREATE TABLE dbo.EpisodeChapter (
	Id int IDENTITY(1,1) PRIMARY KEY CLUSTERED
	,EpisodeId int NOT NULL FOREIGN KEY REFERENCES dbo.Episode(Id)
	,ChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.Chapter(Id)
	,EpisodeChapterDescription varchar(MAX) NOT NULL
);
GO

CREATE TABLE dbo.EpisodeChapterPlayer (
	EpisodeChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.EpisodeChapter(Id)
	,PlayerId int NOT NULL FOREIGN KEY REFERENCES dbo.Player(Id)
);
GO

CREATE TABLE dbo.EpisodeChapterLocation (
	EpisodeChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.EpisodeChapter(Id)
	,LocationId int NOT NULL FOREIGN KEY REFERENCES dbo.Location(Id)
);
GO

CREATE TABLE dbo.EpisodeChapterProphecy (
	EpisodeChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.EpisodeChapter(Id)
	,ProphecyId int NOT NULL FOREIGN KEY REFERENCES dbo.Prophecy(Id)
);
GO

CREATE TABLE dbo.EpisodeChapterOrganization (
	EpisodeChapterId int NOT NULL FOREIGN KEY REFERENCES dbo.EpisodeChapter(Id)
	,OrganizationId int NOT NULL FOREIGN KEY REFERENCES dbo.Organization(Id)
);
GO

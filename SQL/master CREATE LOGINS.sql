USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [WoTPatternReader_app]    Script Date: 5/24/2020 1:47:21 PM ******/
CREATE LOGIN [WoTPatternReader_app] WITH PASSWORD=N'T16f3JUag+zJPP+8TNwLwIPmPsCoQVWF3ZTADwUlClw=', DEFAULT_DATABASE=[WotPatternReader], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [WoTPatternReader_app] DISABLE
GO


USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [WoTPatternReader_admin]    Script Date: 5/24/2020 1:47:28 PM ******/
CREATE LOGIN [WoTPatternReader_admin] WITH PASSWORD=N'uooYU0dCW3EhbtecN9C3ssid2NPd1DpsF5dptNpgq2Q=', DEFAULT_DATABASE=[WotPatternReader], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [WoTPatternReader_admin] DISABLE
GO



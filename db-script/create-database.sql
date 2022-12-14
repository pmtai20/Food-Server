USE [master]
GO
/****** Object:  Database [FoodDeliveryDB]    Script Date: 12/2/2022 2:14:53 AM ******/
CREATE DATABASE [FoodDeliveryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodDeliveryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSEVER\MSSQL\DATA\FoodDeliveryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodDeliveryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSEVER\MSSQL\DATA\FoodDeliveryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FoodDeliveryDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodDeliveryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodDeliveryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FoodDeliveryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodDeliveryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodDeliveryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodDeliveryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodDeliveryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodDeliveryDB] SET  MULTI_USER 
GO
ALTER DATABASE [FoodDeliveryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodDeliveryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodDeliveryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodDeliveryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodDeliveryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodDeliveryDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FoodDeliveryDB] SET QUERY_STORE = OFF
GO
ALTER DATABASE [FoodDeliveryDB] SET  READ_WRITE 
GO

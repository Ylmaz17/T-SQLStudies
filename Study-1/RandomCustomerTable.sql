DECLARE @I AS INT = 0
DECLARE @FIRTSNAME AS VARCHAR(50)
DECLARE @LASTNAME AS VARCHAR(50)
DECLARE @GENDER AS VARCHAR(1)
DECLARE @BIRTHDATE AS DATE
DECLARE @EMAIL AS VARCHAR(50)

WHILE @I <= 10000
	BEGIN
		-- Rastgle id sonucu d�nen de�erler local de�i�kenlere atad�k.
		SELECT @FIRTSNAME = FirstName, @GENDER = Gender FROM names WHERE Id = ROUND(1 + RAND() * 159, 0)
		SELECT @LASTNAME = LastName FROM surnames WHERE Id = ROUND(1 + RAND() * 732, 0)

		-- M��teri ya� aral��� 1980-2005 olarak belirlenmi�tir.(25*365 = 9125)
		SET @BIRTHDATE=DATEADD(DAY,ROUND(1 + RAND() * 9125, 0),'19800101')
		
		-- Email alan� ad ve soyad de�erleri aras�na _ konularak belirlenmi�tir.
		SET @EMAIL = LOWER(@FIRTSNAME) + '_' + LOWER(@LASTNAME)
		SET @EMAIL = @EMAIL + '@ornekemail.com'

		INSERT INTO CUSTOMERS (FirstName,LastName,Gender,BirthDate,Email) VALUES
		(@FIRTSNAME,@LASTNAME,@GENDER,@BIRTHDATE,@EMAIL)
		
		SET @I =@I + 1
	END
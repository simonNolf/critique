/*Procédure pour lier un token généré client-side à un nom dutilisateur, avec différent codes en fonction du résultat*/
CREATE PROCEDURE DBA.http_login( IN in_username VARCHAR(16), IN in_password VARCHAR(20), IN in_token VARCHAR(20) )
RESULT ("status" INT)
BEGIN
    DECLARE @statusVal INT;
    IF (existentToken(in_token) = 1)
        THEN SET @statusVal = 501;
    ELSEIF (existentUser(in_username) = 0)
        THEN SET @statusVal = 502;
    ELSEIF ("login"(in_username, in_password) = 0)
        THEN SET @statusVal = 503;
    ELSE BEGIN
            SET @statusVal = 200;
            INSERT INTO tbSession(token, username) VALUES (in_token, in_username);
         END
    ENDIF;
    SELECT @statusVal;
END;

/*CrÃ©er un compte*/
CREATE PROCEDURE DBA.http_register( IN in_username VARCHAR(16), IN in_password VARCHAR(20) )
RESULT ("status" INT)
BEGIN
    IF (in_username IS NULL OR in_password IS NULL)
    THEN SELECT 503;
    ELSE BEGIN
            DECLARE @statusVal INT;
            IF (existentUser(in_username) = 0)
            THEN BEGIN
                    SET @statusVal = 200;
                    INSERT INTO tbUsers VALUES (in_username, in_password)
                 END
            ELSE SET @statusVal = 501
            ENDIF;
            SELECT @statusVal;
        END;
    ENDIF;
END;

/*VÃ©rifie si un token est associÃ© Ã  un compte et n'est pas pÃ©rimÃ©*/
CREATE PROCEDURE DBA.http_verifyToken( IN in_token VARCHAR(20) )
RESULT ("status" INT)
    BEGIN
    	DECLARE @statusVal INT;
        IF (existentToken(in_token) = 1 AND (SELECT hours(dateCreation, CURRENT DATE) FROM tbSession WHERE token = in_token) < 24)
        THEN SET @statusVal = 200;
        ELSE BEGIN
                SET @statusVal = 503;
                DELETE FROM tbSession WHERE token = in_token;
             END
        ENDIF;
        SELECT @statusVal;
    END;

/*se dÃ©connecter, cÃ d effacer le lien token / nom d'utilisateur*/
CREATE PROCEDURE DBA.http_logout( IN in_token VARCHAR(20) )
RESULT (html TEXT)
BEGIN
    DELETE FROM tbSession WHERE token = in_token;
    CALL http_getPage('index');
END;

/*obtention du nom d'utilisateur Ã  partir du token*/
CREATE PROCEDURE DBA.http_getUsername( IN in_token VARCHAR(20) )
RESULT ("status" INT, "username" VARCHAR(15))
BEGIN

    IF (existentToken(in_token) = 1)
    THEN BEGIN 
            SELECT 200, username FROM tbSession WHERE token = in_token;
         END
    ELSE BEGIN
            SELECT 503, '';
         END
    ENDIF;
END;

/*procÃ©dure HTML renvoit ver l'index si la page n'existe pas*/
CREATE PROCEDURE DBA.http_getPage(in page long varchar)
RESULT (html TEXT)
BEGIN
    DECLARE @html_file TEXT;
	CALL sa_set_http_header( 'Content-Type', 'text/html' );
    SET @html_file = xp_read_file(getPath() || page || '.html');
    IF @html_file IS NULL 
    THEN SELECT xp_read_file(getPath() || 'index' || '.html')
    ELSE SELECT @html_file
    ENDIF;
END;

/*procÃ©dure JS*/
CREATE PROCEDURE DBA.http_getJS( IN js TEXT )
RESULT( js TEXT )
BEGIN
	CALL sa_set_http_header( 'Content-Type', 'application/javascript' );
    SELECT xp_read_file(getPath() || 'js/' || js);    
END;

/*procÃ©dure CSS*/
CREATE PROCEDURE DBA.http_getCSS( IN css TEXT )
RESULT( js TEXT )
BEGIN
	CALL sa_set_http_header( 'Content-Type', 'text/css' );
    SELECT xp_read_file(getPath() || 'css/' || css);    
END;

/*procÃ©dure IMAGES*/
CREATE PROCEDURE DBA.http_getIMG(in url TEXT)
BEGIN
    call sa_set_http_header('Content-Type', 'image/png');
	select xp_read_file(dba.getPath() || 'IMG/' || url);
END;
/*trouver le r�pertoire de base*/
CREATE FUNCTION DBA.getPath()
RETURNS TEXT
DETERMINISTIC
BEGIN
	RETURN LEFT(DB_PROPERTY('file'), (LENGTH(DB_PROPERTY('file')) - LENGTH(DB_PROPERTY('name')) - 3))
END;

/*v�rifie que le couple nom d'utilisateur / mdp est correct*/
CREATE FUNCTION dba."login"( IN in_username VARCHAR(16), IN in_password VARCHAR(20))
RETURNS INTEGER
BEGIN
	DECLARE @cmpt INTEGER;
	SET @cmpt = (SELECT count(username)
                 FROM tbUsers
                 WHERE username = in_username AND password = in_password);
	RETURN @cmpt;
END;

/*v�rifie si le token est d�j� utilis� ailleurs*/
CREATE FUNCTION DBA.existentToken( IN in_token VARCHAR(20)) 
RETURNS INTEGER
BEGIN
	DECLARE @cmpt INTEGER;
	SET @cmpt = (SELECT count(token)
                 FROM tbSession
                 WHERE token = in_token);
	RETURN @cmpt;
END;

/*v�rifie si le nom d'utilisateur est d�j� utlis�*/
CREATE FUNCTION DBA.existentUser( IN in_username VARCHAR(16))
RETURNS INTEGER
BEGIN
	DECLARE @cmpt INTEGER;
	SET @cmpt = (SELECT count(username)
                 FROM tbUsers
                 WHERE username = in_username);
	RETURN @cmpt;
END;
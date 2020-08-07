/*web service HTML*/
CREATE SERVICE "root" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS CALL http_getPage(:url);

/*web service JS*/
CREATE SERVICE "js" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS CALL http_getJS(:url);

/*web service CSS*/
CREATE SERVICE "css" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getCSS(:url);


/*web service images*/
CREATE SERVICE "img" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getIMG(:url);

/*connexion*/
CREATE SERVICE "loginService" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" METHODS 'GET' AS CALL http_login(:user, :password, :token);

/*inscription*/
CREATE SERVICE "registerService" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" METHODS 'GET' AS CALL http_register(:user, :password);

/*v?ification de token*/
CREATE SERVICE "verifyToken" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" METHODS 'GET' AS CALL http_verifyToken(:token);

/*obtenir le nom d'utilisateur*/
CREATE SERVICE "username" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" METHODS 'GET' AS CALL http_getUsername(:token);

/*se d?onnecter*/
CREATE SERVICE "logout" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" METHODS 'GET' AS CALL http_logout(:token);

/*charger un profil*/
CREATE SERVICE "getProfile" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" METHODS 'GET' AS CALL http_getProfile(:user, :token);

/*charger nombre de membre */
CREATE SERVICE "membre" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" METHODS 'GET' AS CALL nbrMembre();
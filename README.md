# Usage
Use to build an image of a webdav server protected by a user password.
Image should be used with env WEB\_DAV\_USER and WEB\_DAV\_PASSWORD for activated 
Authentification.

Volume /usr/local/apache2/htdocs/ will contains webdav datas.

Configure volume /ssl to contains cert.key (private ssl key) and cert.cert (associated certificate) to activate ssl.

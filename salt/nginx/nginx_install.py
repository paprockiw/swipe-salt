import os
import sys
from toolbox.comand_chain import *

# fist get nginx files
if cmd_exists("git"):

    os.mkdir("nginx")
    os.chdir("nginx")
    cmd("curl -LO http://nginx.org/download/nginx-1.3.4.tar.gz")
    cmd("tar xf nginx-1.3.4.tar.gz")
    cmd("mv nginx-1.3.4 src")
    cmd("git clone https://github.com/vkholodkov/nginx-upload-module.git")
    cmd("git clone https://github.com/agentzh/echo-nginx-module.git")
    # cmd("git clone https://github.com/shairontoledo/nginx-upload-module.git")
    os.chdir("nginx-upload-module")
    cmd("git branch 2.2 remotes/origin/2.2")
    cmd("git checkout 2.2")
    

else:
    print "please install git"
    sys.exit()

os.chdir("..")
os.chdir("src")
NGX_PREFIX = os.path.abspath('..')
cmd_os("""./configure --prefix=%(NGX_PREFIX)s \
dule=../nginx-upload-module \
dule=../echo-nginx-module \
ebug \
ttp_stub_status_module \
ttp_flv_module \
ttp_ssl_module \
ttp_dav_module \
ttp_gzip_static_module \
ttp_realip_module \
ail \
ail_ssl_module \
pv6  \
cre """ % {"NGX_PREFIX":NGX_PREFIX} )\
.chain("sudo make")\
.chain("sudo make install")\
.run()


# setup nginx.conf
nginx_conf = """

rocesses  1;


er_connections  1024;



ude       mime.types;
ult_type  application/octet-stream;

file        on;

alive_timeout  65;

r_log logs/debug.log debug;

  on;
_http_version 1.1;
_vary on;
_comp_level 6;
_proxied any;
_types  text/css text/javascript application/x-javascript;
_buffers 16 500k;



ream swipe-menu {
server 127.0.0.1:8080;


er {
listen       80;
server_name  localhost;

# Allow file uploads max 50M for example
client_max_body_size 50M;

location ~ ^/upload/.* {

    upload_pass @after-upload;

    # Store files to this directory
    upload_store /home/ruahman/swipe-framework/nginx/uploads;

    # Allow uploaded files to be world readable
    upload_store_access user:rw group:rw all:r;

    # Set specified fields in request body
    upload_set_form_field $upload_field_name.name "$upload_file_name";
    upload_set_form_field $upload_field_name.content_type "$upload_content_type";
    upload_set_form_field $upload_field_name.path "$upload_tmp_path";

    # Inform backend about hash and size of a file
    upload_aggregate_form_field "$upload_field_name.md5" "$upload_file_md5";
    upload_aggregate_form_field "$upload_field_name.size" "$upload_file_size";

    upload_pass_form_field "model";

    upload_cleanup 400 404 499 500-505;

}

location @after-upload {
    # echo after-upload;
    rewrite  /upload/(.*) /api/$1 last;
}

location ~ ^/api/(?<app>[^/]+)/.* {
    # echo api;
    if ( $app = "swipe-menu" ) {
        echo swipe-menu;
        # rewrite url
        rewrite /api/(.*) /$1 break;
        proxy_pass http://swipe-menu;
    }
}

location / {
    root /home/ruahman/swipe-framework/client;
}





""" % ({"path":os.path.abspath('../..')})

os.chdir("../..")

cmd("sudo chmod -R 777 nginx/")

file = open("nginx/conf/nginx.conf","w") 
file.write(nginx_conf)
file.close()

# # setup write permision to uploads
# for i in range(10):
#     cmd("mkdir -p nginx/uploads/"+str(i))
    
cmd("mkdir -p nginx/uploads")
cmd("sudo chmod -R 777 nginx/uploads")

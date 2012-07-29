from fabric.api import *
from fabric.operations import run, put

env.use_ssh_config = True

env.hosts = ['pypoll']

def deploy():
        run('mkdir -p /home/ubuntu/pypoll')

        put('pypoll', '/home/ubuntu')

def host_type():
    run('uname -s')
#!/bin/bash

echo 'user="${user}"' >> /etc/profile.d/.env
echo 'password="${password}"' >> /etc/profile.d/.env
echo 'port=${port}' >> /etc/profile.d/.env
echo 'dbname="${dbname}"' >> /etc/profile.d/.env
echo 'SECRET="${SECRET}"' >> /etc/profile.d/.env
echo 'pass="${pass}"' >> /etc/profile.d/.env
echo 'email="${email}"' >> /etc/profile.d/.env


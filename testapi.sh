#!/bin/bash
# Call this script with at least 1 parameter, for example
# ./testapi apiname arg1 arg2

if [ "$1" = "create_user" ]; then 
    echo "Creating User"
    echo 'curl -v -H "Content-Type: application/json" -X POST --data '{"birthday" : "2015-03-30", "gender": "1", "first_name": "John", "last_name": "Doe", "email" : "goooch_attack\$2@catfacts.co", "username": "lotus_user\$2", "raw_password": "password"}' https://secure-headland-8362.herokuapp.com/api/v1/create_user/'
    curl -v -H "Content-Type: application/json" -X POST --data '{"birthday" : "2015-03-30", "gender": "1", "first_name": "John", "last_name": "Doe", "email" : "goooch_attack\$2@catfacts.co", "username": "lotus_user\$2", "raw_password": "password"}' https://secure-headland-8362.herokuapp.com/api/v1/create_user/
fi;

if [ "$1" = "get_exercise_session" ]; then
    echo "Getting session"
    curl -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/exercise_session
#--data '{"apns_token" = 78460e9ba5e93bfb509b877374b96d4899a5fa51539ab3417a42e4a765e154cf,birthday = "1991-12-18","created_at" = "2015-11-15T14:23:50.785821","exercise_day_of_week" = 0,"exercise_time" = "08:00:00",gender = 0,id = 94, "meditation_time" = "07:00:00","resource_uri" = "/api/v1/user_profile/94/","updated_at" = "2015-11-15T14:24:14.907832",user =     {email = "shockandhorror@evilmastermind.com","first_name" = Tee,id = 122, "last_name" : Hee, "resource_uri": "/api/v1/user/122/", username : "dr.dracula"}' 

fi;

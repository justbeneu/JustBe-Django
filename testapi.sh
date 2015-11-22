#!/bin/bash
# Call this script with at least 1 parameter, for example
# ./testapi apiname arg1 arg2

if [ "$1" = "-h" ]; then
    echo "./testapi testname suffix"
fi;

SPACE=" "
URL="https://secure-headland-8362.herokuapp.com/api/v1/"
HEADER='curl -i -v -H "Content-Type: application/json"'
POST="-X POST"
GET="-X GET"
PATCH="-X PATCH"
PUT="-X PUT"

#SUFFIX=$(( ( RANDOM % 999 )  + 1 ))
DATA=""
CALL=""


if [[ "$1" = "get_users" ]]; then 
    echo "Get users"
    CALL=${HEADER}${SPACE}${GET}${SPACE}${URL}"user/"
    echo $CALL
    eval $CALL
fi;

if [[ "$1" = "create_user" ]]; then 
    echo "Creating User"
    DATA="--data '{\"birthday\" : \"2015-03-30\", \"gender\": \"1\", \"first_name\": \"John\", \"last_name\": \"Doe\", \"email\" : \"goooch_attack"$2"@catfacts.co\", \"username\": \"lotus_user"$2"\", \"raw_password\": \"password\"}'" 
    CALL=${HEADER}${SPACE}${POST}${SPACE}${DATA}${SPACE}${URL}"create_user/"
    echo $CALL
    eval $CALL
fi;

if [ "$1" = "update_user" ]; then
    echo "Updating existing user"
    echo "Updating meditation/exercise details"
    curl --cookie "sessionid=70ctwv08xdygcmmnsdtq3gx3wu8i213t" -v -H "Content-Type: application/json" -X PATCH --data '{"meditation_time": "11:46:42","exercise_day_of_week": "1","exercise_time": "11:46:42", "apns_token":"elq4p3nn1tyqk9nu5gnd2w5jx389pw66"}' https://secure-headland-8362.herokuapp.com/api/v1/user_profile/
    echo "Updating user metadata"
    curl --cookie "sessionid=s02bv090lzatolhhuzctl6qsjeet3wqz" -v -H "Content-Type: application/json" -X PATCH --data '{"created_at": "2015-04-15T16:00:00.838086", "apns_token":"elq4p3nn1tyqk9nu5gnd2w5jx389pw66"}' https://secure-headland-8362.herokuapp.com/api/v1/user_profile/
    echo "Logging User in"
    curl -v -H "Content-Type: application/json" -X POST --data '{"username": "ghking", "password": "blink182"}' https://secure-headland-8362.herokuapp.com/api/v1/user/login/
fi;

if [ "$1" = "login_user" ]; then
    echo "Login user"
    echo 'curl -v -H "Content-Type: application/json" -X POST --data '{"username": "lotus_user40", "password": "password"}' https://secure-headland-8362.herokuapp.com/api/v1/user/login/'
    curl -v -H "Content-Type: application/json" -X POST --data '{"username": "lotus_user40", "password": "password"}' https://secure-headland-8362.herokuapp.com/api/v1/user/login/
fi;

if [ "$1" = "logout_user" ]; then
    echo "Logout user"
    echo 'curl --cookie "sessionid=sjaooxh4pck3eli4m3y4dvc8wevlwz5z" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/user/logout/'
    curl --cookie "sessionid=sjaooxh4pck3eli4m3y4dvc8wevlwz5z" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/user/logout/
fi; 

if [[ "$1" = "get_session" ]]; then
    echo "Get existing exercise sessions"
    COOKIE=$2
    CALL=${HEADER}${SPACE}"--cookie "${COOKIE}${SPACE}${GET}${SPACE}${URL}"exercise_session/"
    echo $CALL
    eval $CALL
    #echo 'curl --cookie "sessionid=8hg0a2o3ipdgcp30lcsn4qrdbzmm0xat" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/exercise_session/'
    #curl --cookie "sessionid=8hg0a2o3ipdgcp30lcsn4qrdbzmm0xat" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/exercise_session/
fi;

if [ "$1" = "post_session" ]; then 
    echo "Creating exercise session"
    echo 'curl --cookie "sessionid=8hg0a2o3ipdgcp30lcsn4qrdbzmm0xat" -v -H "Content-Type: application/json" -X POST --data '{"exercise_id": "101"}' https://secure-headland-8362.herokuapp.com/api/v1/exercise_session/'
    curl --cookie "sessionid=8hg0a2o3ipdgcp30lcsn4qrdbzmm0xat" -v -H "Content-Type: application/json" -X POST --data '{"exercise_id": "101"}' https://secure-headland-8362.herokuapp.com/api/v1/exercise_session/
fi;

if ["$1" = "post_meditaion" ]; then
    echo "Creating meditation session"
    echo 'curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X POST --data '{"percent_completed": ".5", "meditation_id": "5"}' https://secure-headland-8362.herokuapp.com/api/v1/meditation_session/'
    curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X POST --data '{"percent_completed": ".5", "meditation_id": "5"}' https://secure-headland-8362.herokuapp.com/api/v1/meditation_session/
fi;

if ["$1" = "update_meditaion" ]; then
    echo "Update meditation"
    echo 'curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X PATCH --data '{"percent_completed": ".7"}' https://secure-headland-8362.herokuapp.com/api/v1/meditation_session/5/'
    curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X PATCH --data '{"percent_completed": ".7"}' https://secure-headland-8362.herokuapp.com/api/v1/meditation_session/5/
fi;

if [ "$1" = "get_meditations" ]; then
    echo "Get meditations"
    echo 'curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/meditation_session/'
    curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/meditation_session/
fi;

if [ "$1" = "update_assessment_start" ]; then
    echo "Update assesment's start time"
    echo 'curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X PATCH --data '{"start_time": "2015-04-14T18:56:59"}' https://secure-headland-8362.herokuapp.com/api/v1/assessment/5/'
    curl --cookie "sessionid=0bznhbj2fullol03tovzqqf850o4w8l6" -v -H "Content-Type: application/json" -X PATCH --data '{"start_time": "2015-04-14T18:56:59"}' https://secure-headland-8362.herokuapp.com/api/v1/assessment/5/
fi;

if [ "$1" = "get_pending_assessment" ]; then
    echo "Get a pending assessment"
    echo 'curl --cookie "sessionid=964hurhgw9ouw2quhkcn7dy1oebwtrtc" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/assessment/get_pending_assessment/'
    curl --cookie "sessionid=964hurhgw9ouw2quhkcn7dy1oebwtrtc" -v -H "Content-Type: application/json" -X GET https://secure-headland-8362.herokuapp.com/api/v1/assessment/get_pending_assessment/
fi;

if [ "$1" = "post_assessment_res" ]; then
    echo "Post assessment response"
    echo 'curl --cookie "sessionid=g7wx1vzizumnie7o8ula2fivw56zqgq0" -v -H "Content-Type: application/json" -X PATCH --data '{"objects":[{"assessment_id":"6","type":"0","boolean":0, "question_id":"12"}, {"assessment_id":"6", "type":"4", "question_id":"13", "multi_selects":[{"selection_id":"3"},{"selection_id":"8"}]}]}' https://secure-headland-8362.herokuapp.com/api/v1/response/'
    curl --cookie "sessionid=g7wx1vzizumnie7o8ula2fivw56zqgq0" -v -H "Content-Type: application/json" -X PATCH --data '{"objects":[{"assessment_id":"6","type":"0","boolean":0, "question_id":"12"}, {"assessment_id":"6", "type":"4", "question_id":"13", "multi_selects":[{"selection_id":"3"},{"selection_id":"8"}]}]}' https://secure-headland-8362.herokuapp.com/api/v1/response/
fi;

if [ "$1" = "push_notification_times" ]; then 
    echo "Push Exercise Times from Pebble Vibration log"
    echo 'curl --cookie "sessionid=g7wx1vzizumnie7o8ula2fivw56zqgq0" -v -H "Content-Type: application/json" -X PATCH --data '{"objects":[{"notification_time" : "2015-04-14T20:29:32"},{"notification_time" : "2015-04-14T23:29:32"}]}' https://secure-headland-8362.herokuapp.com/api/v1/exercise_reminder/'
    curl --cookie "sessionid=g7wx1vzizumnie7o8ula2fivw56zqgq0" -v -H "Content-Type: application/json" -X PATCH --data '{"objects":[{"notification_time" : "2015-04-14T20:29:32"},{"notification_time" : "2015-04-14T23:29:32"}]}' https://secure-headland-8362.herokuapp.com/api/v1/exercise_reminder/
fi;




icao=$1
 
if [[ ${#icao} -ne 4 ]]; then
    exit
fi
 
#Available sources:
#https://en.allmetsat.com/metar-taf/europe.php?icao=xxxx
#https://metars.com/stations/xxxx.html
#https://aviationweather.gov/metar/data?ids=xxxx
 
curl -s "https://aviationweather.gov/metar/data?ids="$icao > ans.html
 
grep -n "<code>" ans.html | awk -F["><"] '{print $3}'
 
rm ans.html
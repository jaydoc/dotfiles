#!/bin/bash
# Lengthen URL using LongURL
# Copyright (c) 2013 Yu-Jie Lin
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

NAME='lu.sh'
VERSION='0.1.0'
USERAGENT="$NAME/$VERSION"

msg_help="\
Usage: $(basename -- "$0") [OPTION]...
Lengthen URL using LongURL

Options:
  -C          do not validate URL for LongURL
  -l          list services
  -h          you are reading it
"

API_SERVICES='http://api.longurl.org/v2/services?format=json'
API_EXPAND='http://api.longurl.org/v2/expand?format=json&all-redirects=1&title=1'

jq_or_cat() {
  if type jq &>/dev/null; then
    jq "${1:-.}"
  else
    cat
  fi
}

_list_services() {
  curl --silent --user-agent "$USERAGENT" "$API_SERVICES"
}

list_services() {
  _list_services | jq_or_cat '. | keys'
}

re_URL() {
  # producing a regular expression for checking input URL
  _list_services |
  jq --raw-output '[[.[].domain + "|"][:-1], [.[].domain][-1:]] | add | add' |
  sed 's_^_^(https?:\/\/)?(_;s_\._\\._g;s_$_)\/.+_'
}

RE_URL="^(https?://)?(➽\.ws|➹\.ws|➯\.ws|➨\.ws|➡\.ws|➞\.ws|➔\.ws|❥\.ws|✿\.ws|✩\.ws|›\.ws|zzang\.kr|zz\.gd|zurl\.ws|zud\.me|zipmyurl\.com|zi\.mu|zi\.ma|z0p\.de|yuarel\.com|youtu\.be|yiyd\.com|yhoo\.it|yfrog\.com|yep\.it|ye\.pe|yatuc\.com|y\.ahoo\.it|xurl\.jp|xurl\.es|xrl\.us|xrl\.in|xr\.com|x\.vu|wp\.me|wipi\.es|wapurl\.co\.uk|wapo\.st|w55\.de|vm\.lc|vl\.am|vgn\.am|vb\.ly|use\.my|usat\.ly|urlzen\.com|urlx\.ie|urlshorteningservicefortwitter\.com|urls\.im|urli\.nl|urlenco\.de|urlcut\.com|urlcover\.com|urlbrief\.com|urlborg\.com|url4\.eu|url360\.me|url\.ie|url\.co\.uk|url\.az|ur1\.ca|updating\.me|ulu\.lu|ub0\.cc|u76\.org|u\.nu|u\.mavrev\.com|twurl\.nl|twurl\.cc|twiturl\.de|twitterurl\.org|twitterurl\.net|twitclicks\.com|twirl\.at|twhub\.com|trunc\.it|tra\.kz|tr\.im|tpm\.ly|toysr\.us|totc\.us|togoto\.us|to\.ly|to\.|ln-s\.ru|ln-s\.net|liurl\.cn|linkbun\.ch|linkbee\.com|liltext\.com|liip\.to|lat\.ms|l9k\.net|krunchd\.com|korta\.nu|klck\.me|kl\.am|jijr\.com|j\.mp|ix\.lt|its\.my|is\.gd|ilix\.in|idek\.net|icanhaz\.com|hurl\.ws|hurl\.me|hulu\.com|huff\.to|htxt\.it|hsblinks\.com|href\.in|hmm\.ph|hiderefer\.com|hex\.io|gurl\.es|goshrink\.com|goo\.gl|go\.usa\.gov|go\.ign\.com|go\.9nl\.com|gl\.am|gizmo\.do|g\.ro\.lt|fwib\.net|fwd4\.me|fuzzy\.to|fuseurl\.com|freak\.to|fon\.gs|fly2\.ws|flq\.us|flic\.kr|firsturl\.net|firsturl\.de|fire\.to|fff\.to|ff\.im|fbshare\.me|fb\.me|fav\.me|fa\.by|eweri\.com|eepurl\.com|easyurl\.net|easyuri\.com|dopen\.us|doiop\.com|bcool\.bz|bacn\.me|b2l\.me|b23\.ru|azc\.cc|atu\.ca|arst\.ch|ar\.gy|amzn\.to|alturl\.com|all\.fuseurl\.com|afx\.cc|adjix\.com|adf\.ly|ad\.vu|abcurl\.net|307\.to|3\.ly|2tu\.us|2big\.at|2\.gp|1url\.com|1link\.in|0rz\.tw|4ms\.me|4sq\.com|4url\.cc|6url\.com|7\.ly|a\.gg|a\.nf|aa\.cx|binged\.it|bit\.ly|bizj\.us|bloat\.me|bravo\.ly|bsa\.ly|budurl\.com|canurl\.com|chilp\.it|chzb\.gr|cl\.lk|cl\.ly|clck\.ru|cli\.gs|cliccami\.info|clickthru\.ca|clop\.in|conta\.cc|cort\.as|cot\.ag|crks\.me|ctvr\.us|cutt\.us|dai\.ly|decenturl\.com|dfl8\.me|digbig\.com|digg\.com|disq\.us|dld\.bz|dlvr\.it|do\.my|lnk\.gd|lnk\.ms|lnkd\.in|lnkurl\.com|lru\.jp|lt\.tl|lurl\.no|macte\.ch|mash\.to|merky\.de|migre\.me|miniurl\.com|minurl\.fr|mke\.me|moby\.to|moourl\.com|mrte\.ch|myloc\.me|myurl\.in|n\.pr|nbc\.co|nblo\.gs|nn\.nf|not\.my|notlong\.com|nsfw\.in|nutshellurl\.com|nxy\.in|nyti\.ms|o-x\.fr|oc1\.us|om\.ly|omf\.gd|omoikane\.net|on\.cnn\.com|on\.mktw\.net|onforb\.es|orz\.se|ow\.ly|ping\.fm|pli\.gs|pnt\.me|politi\.co|post\.ly|pp\.gg|profile\.to|ptiturl\.com|pub\.vitrue\.com|qlnk\.net|qte\.me|qu\.tc|qy\.fi|r\.im|rb6\.me|read\.bi|readthis\.ca|reallytinyurl\.com|redir\.ec|redirects\.ca|redirx\.com|retwt\.me|ri\.ms|rickroll\.it|riz\.gd|rt\.nu|ru\.ly|rubyurl\.com|rurl\.org|rww\.tw|s4c\.in|s7y\.us|safe\.mn|sameurl\.com|sdut\.us|shar\.es|shink\.de|shorl\.com|short\.ie|short\.to|shortlinks\.co\.uk|shorturl\.com|shout\.to|show\.my|shrinkify\.com|shrinkr\.com|shrt\.fr|shrt\.st|shrten\.com|shrunkin\.com|simurl\.com|slate\.me|smallr\.com|smsh\.me|smurl\.name|sn\.im|snipr\.com|snipurl\.com|snurl\.com|sp2\.ro|spedr\.com|srnk\.net|srs\.li|starturl\.com|su\.pr|surl\.co\.uk|surl\.hu|t\.cn|t\.co|t\.lh\.com|ta\.gd|tbd\.ly|tcrn\.ch|tgr\.me|tgr\.ph|tighturl\.com|tiniuri\.com|tiny\.cc|tiny\.ly|tiny\.pl|tinylink\.in|tinyuri\.ca|tinyurl\.com|tk\.|tl\.gd|tmi\.me|tnij\.org|tnw\.to|tny\.com)/.+"

NO_CHECK=

while getopts 'Clrh' opt; do
  case "$opt" in
    C)
      NO_CHECK=1
      ;;
    l)
      list_services
      exit 0
      ;;
    r)
      re_URL
      exit 0
      ;;
    h)
      echo "$msg_help"
      exit 0
  esac
done
shift $((OPTIND-1))

if [[ -z "$NO_CHECK" ]] && ! echo "$1" | egrep "$RE_URL" &>/dev/null; then
  echo "Not a valid URL for LongURL: $1" >&2
  exit 1
fi

curl --silent --user-agent "$USERAGENT" "$API_EXPAND&url=$1" | jq_or_cat

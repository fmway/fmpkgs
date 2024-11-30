set addons_raw "$(cat ./firefox-addons/addons.json)"
set result "{ pkgs, lib, ... }: let
  buildFirefoxXpiAddon = import ./buildFirefoxXpiAddon.nix { inherit pkgs lib; };
in {
"
for i in (seq 0 (math (echo "$addons_raw" | jq '. | length') - 1))
set ctx "$(echo "$addons_raw" | jq ".[$i]")"
set name "$(echo "$ctx" | jq -r .name)"
set slug "$(echo "$ctx" | jq -r '.slug // "'$name'"')"
set query "$(echo "$ctx" | jq -r '.query // "'$slug'"')"
set res "$(curl -s -X GET "https://addons.mozilla.org/api/v5/addons/search/?q=$query&type=extension&app=firefox" | jq .results[0])"
set result $result" $name = buildFirefoxXpiAddon {"\n
set result $result"    pname = \"$slug\";"\n
set result $result"    version = \"$(echo "$res" | jq -r '.current_version.version // "1.0.0"')\";"\n
set result $result"    addonId = \"$(echo "$res" | jq -r .guid)\";"\n
set result $result"    url = \"$(echo "$res" | jq -r .current_version.file.url)\";"\n
set result $result"    sha256 = \""(echo "$res" | jq -r .current_version.file.hash | string split :)[2]"\";"\n
set result $result"    meta = {"\n
# set result $result"      description = \"$(echo "$res" | jq -r '.description."en-US" // ""')\";"\n
set result $result"      homepage = \"$(echo "$res" | jq -r '.homepage.url."en-US" // ""')\";"\n
set result $result"      mozPermissions = ["\n
set result $result"$(echo "$res" | jq '.current_version.file.permissions[]' | awk '{print "        "$1}')"\n
set result $result"      ];"\n
set result $result"      # todo"\n
set result $result"      licenses = with lib.licenses; [];"\n
set result $result"      platforms = lib.platforms.all;"\n
set result $result"    };"\n
set result $result"  };"\n
end
set result $result"}"
echo "$result" > ./firefox-addons/generated_addons.nix

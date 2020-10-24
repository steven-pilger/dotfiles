# Defined in - @ line 1
function zz --wraps='fasd_cd -d -i' --description 'alias zz=fasd_cd -d -i'
  fasd_cd -d -i $argv;
end

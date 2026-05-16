local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
if BinaryFormat == "dll" then
elseif BinaryFormat == "dylib" then
elseif BinaryFormat == "so" then
end



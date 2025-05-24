-- Enter/exit Tilemaker
function init_function()
end
function exit_function()
end

node_keys = {}
function node_function()
end

function way_function()
end

-- Remap coastlines and landcover
function attribute_function(attr,layer)
	local lattr = lowercase_keys(attr)

	if lattr["min_zoom"] then
		lattr["_minzoom"] = lattr["min_zoom"]
	end

	return lattr
end

function lowercase_keys(table)
	local result = {}
	for k, v in pairs(table) do
		result[string.lower(k)] = v
	end
	return result
end

alias f := format

_default:
	@just -l

formatter := "stylua"

format:
        {{formatter}} ./.stylua.toml  ./init.lua ./lua/*

        
        

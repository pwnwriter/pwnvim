alias f := format

formatter := "stylua"

format:
        {{formatter}} ./.stylua.toml  ./init.lua ./lua/*

        
        

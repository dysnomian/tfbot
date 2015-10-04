# As anyone
# /ex Andrea
#> "Andrea is a pixie..."


# Depending on active character
# Returns the active description of their active character
# /ex @kyborg
#> "Kylie is a cyborg..."
#> "Kale is a cyborg..."

# As a character's non-owner
# /use Kylie
#> "Kylie is not one of your characters."

# As a character's owner
# /use Kylie
#> "Using Kylie as your character."

# /use Kylie cowgirl
#> "Using Kylie as your character."

# /characters
#> "*@kyborg's Characters:"\
#> "*Kale*:"\
#> "Description 1: 'Kale is...'"\
#> "*Kylie*:"\
#> "Default (active): 'Kylie is...'"\
#> "Cowgirl: 'Kylie is...'"\
#
# /rename Kale Kylie
#
# /load character Kylie
# /load character Kylie cowgirl
# /load d
# /load description cowgirl
# /load desc cowgirl
# 
# /load character Kylie
# /load description Andrea:pixie
#
# /character new Alex
# /description new Alex "Alex is a..."
# /description new puppygirl "Alex is a puppygirl..."
# /description new Alex:puppygirl "Alex is a puppygirl..."
#
# /tf Alex Alex:puppygirl
# /tf Alex Alex:puppygirl "Alex is a puppygirl..."
#
# character Liss
# character eristic.Liss
#
# /load character Liss
# /load character eristic:Liss

-- Code to lay out toki pona glyphs in arrays by shape class.

-- Start a group  The name goes out in bold, followed by
-- the start of the table with the proper number of
-- columns.
function grouphead(name)
  tex.print(string.format("\\section*{%s}", name))
  tex.print("\\begin{tabular}{")
  for col=1, wid do
    tex.sprint(" p{1.2cm}")
    end
  tex.sprint(" }")
  end

-- Close out the table.
function endgroup()
  tex.print("\\end{tabular}")
  end

-- Process a group of similarly shaped glyphs.  The first word
-- in the string is the group name.
function group(line)
  local wn = 0		       -- Word Number
  local col = 1		       -- Column Number
  for word in (line):gmatch "%a*" do
    if(wn == 0)		    -- First word is the group name
    then
      grouphead(word)		-- Emit header and start table
      col = 1
    else
      if( col > wid )		-- Exceeded max columns
      then
        tex.sprint(" \\\\[0.5cm]")
	col = 1
      else
        if( col > 1 )		-- Additional column
	then
	  tex.sprint(" & ")
	end
      end
      tex.sprint(string.format("\\tpGlyph{%s}", word)) -- Emit one glyph cell
      col = col + 1
      end
    wn = wn + 1
    end
  if( col > 1 )		-- End of string. Partial row already out?
  then
    tex.sprint(" \\\\")
  end
  endgroup()		-- Finish the table
  end

wid = 10			-- Maximum columns

-- Output all the words
group("Circles ijo lawa isipin kili ma mani nasa sike suno tenpo nimi samu palisa misikeke lukin")
group("People jan wawa meli mije mama tonsi moli toki kokosila lape kulupu apeja")
group("Ds alasa kalama uta kuntu ")
group("Sixes mi ona sina")
group("Squares lipu len linluwi sona sitelen pu ku pakala leko")
group("Boxes monsi sinpin anpa insa poka ete open poki ")
group("Straights a o n wa kin lon powe nasin epiku ni pini taso nanpa wan po san sama tu mute meso sin namako majuna seli supa selo sijelo")
group("Angles kiki ala ante weka anu e li suli lili utala monsuta pan en lete ken pi kipisi te to yupekosi")
group("Triangles kule laso loje walo kapesi jelo unu pimeja mulapisu")
group("Curves ale ike pona la kon telo jasima kute linja musi nena lupa seme tan wile")
group("Hands luka kepeken pana pali moku")
group("Feet noka awen tawa kama")
group("Animals akesi kala pipi sutopatikuna  waso soweli suwi misa mu kijetesantakalu ")
group("Squiggles unpa lanpan jaki esun sewi jo kasi waleja")
group("Pictograms olin pilin mun ko kiwen tomo ilo oko soko")

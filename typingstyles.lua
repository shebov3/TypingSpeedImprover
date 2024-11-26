local styles = {}

--?MY OWN UNIQUE TYPING STYLE
styles.Default = {
  {"a","q"},                      -- Left Pinky
  {"s","w","z"},                  -- Left Ring
  {"d","e","x"},                  -- Left Middle 
  {"c","r","f","v","b","g","t"},  -- Left Index
  {"y","h","n","m","j","u"},      -- Right Index
  {"k","i"},                      -- Right Middle
  {"o","l"},                      -- Right Ring
  {"p"}                           -- Right Pinky
}

styles.Custom = {
  {"q","a","z"},
  {"w","s","x"},
  {"e","d"},
  {"t","g","c","v","f","r"},
  {"y","h","b","n","m","j","u"},
  {"i","k"},
  {"o","l"},
  {"p"}
}

--?STANDARD TYPING TECHNIQUE    
styles.Standard = {
  {"a","q","z"},              -- Left Pinky
  {"s","x","w"},              -- Left Ring
  {"c","d","e"},              -- Left Middle 
  {"r","f","v","b","g","t"},  -- Left Index
  {"y","h","n","m","j","u"},  -- Right Index
  {"k","i"},                  -- Right Middle
  {"o","l"},                  -- Right Ring
  {"p"}                       -- Right Pinky
}

--?ANGLE MOD TECHNIQUE    
styles.AngleMod = {
  {"a","q"},                      -- Left Pinky
  {"s","w","z"},                  -- Left Ring
  {"d","e","x"},                  -- Left Middle 
  {"c","r","f","v","b","g","t"},  -- Left Index
  {"y","h","n","m","j","u"},      -- Right Index
  {"k","i"},                      -- Right Middle
  {"o","l"},                      -- Right Ring
  {"p"}                           -- Right Pinky
}
--?GAMER STYLE TECHNIQUE
styles.Gamer = {
  {"a","q","z"},                                  -- Left Pinky
  {"s","x","w"},                                  -- Left Ring
  {"c","d","e"},                                  -- Left Middle 
  {"r","f","v","b","g","t"},                      -- Left Index
  {"y","h","n","m","j","u","k","i","o","l","p"}   -- Right Index
}

--?2 FINGERS STYLE
styles.TwoFingers = {
  {"a","q","z","s","x","w","c","d","e","r","f","v","b","g","t"},  -- Left Index
  {"y","h","n","m","j","u","p","k","i","o","l",'p'},              -- Right Index    
}
return styles
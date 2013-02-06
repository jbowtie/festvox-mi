(lts.ruleset
;  Name of rule set
 maori
;  Sets used in the rules
(
  (AEOU a e o u )
)
;  Rules
;  TODO: add rules for macrons
(
 ( [ n g ] = ng )
 ( [ w h ] = f )
 ( [ o e ] = oy )
 ( [ a ] = aa )
 ( [ e ] = ey )
 ( [ i ] = iy )
 ( [ o ] = ow )
 ( [ u ] = uw )
 ( [ h ] = hh )
 ( [ k ] = k )
 ( [ m ] = m )
 ( [ n ] = n )
 ( [ p ] = p )
 ( [ r ] = r )
 ( [ t ] = t )
 ( [ w ] = w )
))


(set! maori_phrase_cart_tree
'
((lisp_token_end_punc in ("?" "." ":"))
  ((BB))
  ((lisp_token_end_punc in ("'" "\"" "," ";"))
   ((B))
   ((n.name is 0)  ;; end of utterance
    ((BB))
    ((NB))))))

(set! maori_accent_cart_tree
 '
  ((R:SylStructure.parent.gpos is content)
   ((stress is 1)
    ((Accented))
    ((position_type is single)
     ((Accented))
     ((NONE))))
   ((NONE))))

(set! maori_el_int_simple_params
    '((f0_mean 120) (f0_std 30)))

(lex.create "maori")
(lex.set.phoneset "maori")
(lex.set.lts.ruleset 'maori)

;;TODO define a custom downcase function to handle macrons
(define (maori_lts word features)
  "(maori_lts WORD FEATURES)
Using letter to sound rules build a maori pronunciation of WORD."
  (list word
        nil
        (lex.syllabify.phstress (lts.apply (downcase word) 'maori))))

(lex.set.lts.method 'maori_lts)

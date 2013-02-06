(define (voice_maori_el)
"(voice_maori_el)
Set up synthesis for Male Maori speaker using KAL diphones"
  (voice_reset)
  (Parameter.set 'Language 'maori)
  ;; Phone set
  (Parameter.set 'PhoneSet 'maori)
  (PhoneSet.select 'maori)
  (set! pos_lex_name nil)
  ;; Phrase break prediction by punctuation
  (set! pos_supported nil)
  ;; Phrasing
  (set! phrase_cart_tree maori_phrase_cart_tree)
  (Parameter.set 'Phrase_Method 'cart_tree)
  ;; Lexicon selection
  (lex.select "maori")
  ;; Accent prediction
  (set! int_accent_cart_tree maori_accent_cart_tree)
  (set! int_simple_params maori_el_int_simple_params)
  (Parameter.set 'Int_Method 'Simple)
  ;; Duration prediction
  ;;(set! duration_cart_tree maori_dur_tree)
  ;;(set! duration_ph_info maori_el_phone_data)
  ;;(Parameter.set 'Duration_Method 'Tree_ZScores)
  (require 'kaldurtreeZ)
  (set! duration_cart_tree kal_duration_cart_tree)
  (set! duration_ph_info kal_durs)
  (Parameter.set 'Duration_Method 'Tree_ZScores)
  (Parameter.set 'Duration_Stretch 1.1)
  ;; Waveform synthesizer: diphones
  (Parameter.set 'Synth_Method 'UniSyn)
  (Parameter.set 'us_sigpr 'lpc)
  (us_db_select 'kal_lpc_group)

  (set! current-voice 'maori_el)
)

(proclaim_voice
  'maori_el
  '((language maori)
    (gender male)
    (dialect standard)
    (description
      "This is a test voice.")))

(provide 'maori_el)

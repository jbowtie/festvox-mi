festvox-mi
==========

Māori voice definition for use with the Festival speech synthesis engine.

This project defines a Māori speaker. The current version simple adds Maori
language support, using the default `kal-diphone` voice included with
most Festival installations.

Future versions will add a native speaker diphone database.

Usage
-----

To test this voice, you will need a working installation of Festival.

Launch festival with the following command line:

    festival mi_phones.scm mi_lts.scm voice_maori_el.scm

Then load the voice:

    festival>  (voice_maori_el)

You can now test the voice using the `SayText` function.

    festival>  (SayText "Tena koe")
    festival>  (SayText "He moana pukepuke e ekengia e te waka")

Use the `quit` function to exit.

    festival>  (quit)

Limitations
-----------

There is no initial "ng" sound in the kal-diphone database.

Macrons and punctuation are not recognised by the initial LTS ruleset,
but this should shortly be rectified.


## Rukovsky

_Ruby + Markov + Louis Zukofsky_

Rukovsky is a Ruby program that generates poems via Markov chains. He's named after the American poet Louis Zukofsky (1904 - 1978) and is inspired by [the work of Matt Furden](https://github.com/zolrath/marky_markov) (whom I owe a beer).

To prepare Rukovsky for writing poems, he needs a sample text (training corpus) to read from. He comes pre-packaged with one (`corpus.txt`, which is just John Keats' _Poems 1817_), but you can alter its contents to your heart's... content. (I would have included poems by Zukovsky, but, you know, copyright stuff.) You can also add new training corpuses and have Rukovsky read from those instead of his default.

To build Rukovsky's internal dictionary and generate a new poem:

    ruby rukovsky remix corpus.txt

You should see:

    Sit tight: Rukovsky's reading.
    Done! Preparing poem...

Followed by a poem between 3 and 33 lines, inclusive. (Lines are between 5 and 15 words, inclusive.)

You can make up your own training corpus and have Rukovsky read it:

    ruby rukovsky remix songs_about_ninjas.txt

And you can call him without arguments, in which case he'll default to reading `corpus.txt` (or throw an error if that file has been removed):

    ruby rukovsky remix 

You can call up his (pretty spartan) help screen with `ruby rukovsky -h` or `ruby rukovsky --help`.

Rukovsky's wired to build his internal dictionary to a depth of 3. Less than that, and he tends to produce gibberish; more than that, and he ends up spewing out entire lines from the training text. Feel free to muck about with his dictionary algorithm (or any part of him, really) and submit pull requests (see below).

## Contributing

1. Fork
2. Create (`git checkout -b fancy-new-feature`)
3. Commit (`git commit -m 'Fanciness'`)
4. Push (`git push origin fancy-new-feature`)
5. Ye Olde Pulle Requeste

## Coming Soon

Tests!


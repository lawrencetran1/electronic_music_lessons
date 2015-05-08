User.create!([
  {first_name: "Audio", last_name:"Pro", email: "audiopro@audiopro.com", password: "password"},
  {first_name: "Mr", last_name:"Synth",email: "mrsynth@mrsynth.com", password: "password"},
  {first_name: "DJ", last_name:"Awesome", email: "djawesome@awesome.com", password: "password"},
])

Tutorial.create!([
  {name: "How EQs Work", description: "Here is a quick introduction to equalizers and how to utilize them in your next music production.", category: "Audio Production"},
  {name: "Synth 101", description: "A synthesizer basics breakdown.", category: "Keyboards"},
  {name: "Synthesizer Tricks", description: "A few creative tips and tricks for programming synth leads", category: "Keyboards"},
  {name: "Electronic Music Theory Tricks", description: "An inside look into the basics of rhythmic devices.", category: "Music Theory"},
])

Lesson.create!([
  {name: "Section One", category: "video", body: "We've all been familiarized with equalizers throughout our lives.  The deep sound of bass or the high pitch of a sirens wail, all differentiated in our brains as variating frequencies.  Sound is essentially energy as an audiible waveform, with frequency being defined as the speed of that sound per cycle measured in Hertz  Humans have a hearing range of 20hz-20khz.", picture: nil, tutorial_id: 1},
  {name: "Section Two", category: "content", body: "Below is a chart of a frequency spectrum and where certain frequencies live in relation to pitch.  This can give a a clearer understanding of what pitches we are altering when manipulating frequencies.", picture: nil, tutorial_id: 1},
  {name: "Section Three", category: "content", body: "When mixing audio, creating sounds or DJing, we can manipulate our digital or analog devices eq by boosting, cutting or filtering certain frequencies. Below is a graphical representation of hi pass and low pass filters and example of a Hi Pass Filter.", picture: nil, tutorial_id: 1},
  {name: "Section One", category: "content", body: "Assuming we are familiar with music theory, lets take a look at what oscillators are in synthesizers. Below is a photo of four sound wave types found in synthesizers.",
    picture: nil, tutorial_id: 2},
  {name: "Section Two", category: "video", body: "Synthesizer envelopes consists of four parameters: Attack, Decay, Sustain, Release. Attack indicates the volume of the initial note attack.  Decay is the amount of volume that decreases.
   Sustain controls the volume at which the sound will loop until the key is release. Which brings use to the release parameter, which is how fast the volume fades after that key release. Check out the video tutorial below.",  
    picture: nil, tutorial_id: 2},
  {name: "Section Three", category: "interactive", body: "Try it out! check out this synthesizer and listen for the different types of oscillators and envelopes present.  Once you know how to differentiate the oscillator and envelope sounds you'll be able to manipulate them accordingly.",  
    picture: nil, tutorial_id: 2},
  {name: "Section One", category: "content", body: "A lead synth sound needs to “cut through” the sonic space in which it’s set. Keep in mind how focused the bandwidth of a lead guitar is. You don’t want a frequency-bloated sound that masks everything, or worse, gets masked by everything else. It needs to play nicely with others. That said, there’s room for a lot of diversity here. 
    A smooth lead sound perfect for instrumental jazz is not going to work for hard progressive rock, for example.",
    picture: nil, tutorial_id: 3},
  {name: "Section Two", category: "content", body: "Related to the attack, legato/solo mode is typically desirable for leads. This gives the player more articulation options by letting intuitive legato playing technique determine envelope re-triggering. ",  
    picture: nil, tutorial_id: 3},
  {name: "Section Three", category:"content", body: "Harmonic activity is important for sustain—this is where the emotion is. This sonic movement, even if it’s subtle, enhances held notes, allowing them to “sing” for quite some time. Synth soloing is similar to singing from a phrasing point of view, so you should dial in slow but steady modulation of harmonics to create the same effect a good singer naturally employs, subtly varying the sustained tone.",  
    picture: nil, tutorial_id: 3},
  {name: "Section Four", category: "content", body: "If available on your controller keyboard, try using release velocity to modulate envelope release time so that a fast key-up causes a fast release time; and a slow key up causes a slow one. Details like this increase playability.",  
    picture: nil, tutorial_id: 3},
  {name: "Section Five", category: "video", body: "https://www.youtube.com/watch?v=B0ZXjb3r4_k",  
    picture: nil, tutorial_id: 3},
  {name: "Section One", category: "content", body: "The Downbeat is the first beat of a measure, hence “the 1″. Historically the term downbeat refers to the downward motion of the orchestra conductor’s hand on the first beat of every measure, regardless of the time signature. ",
    picture: nil, tutorial_id: 4},
  {name: "Section Two", category: "content", body: "The Upbeat is the last beat of a measure and is weaker than the downbeat.",  
    picture: nil, tutorial_id: 4},
  {name: "Section Three", category:"content", body: "The Pickup, also known as an anacrusis – one or more notes sounding prior to the first downbeat of a musical phrase.",  
    picture: nil, tutorial_id: 4},  
  {name: "Section Four", category:"content", body: "Syncopation,This constant, regular shift of the accent from the stronger beats to the weaker beats is known as syncopation. ",  
    picture: nil, tutorial_id: 4},
  {name: "Section Five", category:"content", body: "Poly-rhythm is the term use to define the occurrence of two or more conflicting rhythms sounding simultaneously",  
    picture: nil, tutorial_id: 4}, 
  {name: "Section Six", category:"content", body: "Cross-rhythm is a polyrhythm that occurs in a longer span of time, not only conflicting against another rhythm, but also against the given meter of the music",  
    picture: nil, tutorial_id: 4},
  {name: "Section Seven", category:"content", body: "Sesquialtera is a term for the occurrence of a triple rhythm and a duple rhythm sounding simultaneously. Again, this is a type of polyrhythm but can exist in a short or long span of time, and it can be seen in my above example highlighted in yellow",  
    picture: nil, tutorial_id: 4},
  {name: "Section Eight", category:"content", body: "Linear Drumming is where a core unit of sounds refrain from sounding simultaneously",  
    picture: nil, tutorial_id: 4},               
])

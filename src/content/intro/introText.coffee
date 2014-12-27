hairColor = {}
for color of Officer.Natalie.colors[2]
  hairColor[color] = color

skinColor = {}
for color of Officer.Natalie.colors[0]
  skinColor[color] = color

eyeColor = {}
for color of Officer.Natalie.colors[1]
  eyeColor[color] = color.capitalize()

Page.Intro = class Intro extends Page
  conditions:
    James: '|officers|James'
    Nat: '|officers|Nat'
    Ship: '|map|Ship'
  text: ->
    element = $("""<page class="slowFadeOut"><text class="full center">
      <p><em>Move between pages using the arrows on the right of the page, your mouse wheel, or the arrow keys.</em></p>
    </text></page>
    <page class="slowFadeIn verySlowFadeOut"><text class="full center">
      <p>Natalie dreamt of fire.</p>
    </text></page>
    <page class="verySlowFadeOut"><text class="full center">
      <p>Natalie dreamt of fire.</p>
      <p>Not the tame fire of a lantern, or even the fierce danger of a forest fire - no, her dream was of Fire, the blaze with which the gods made the stars, or with which they burned the skies and scorched the land baren three thousand years ago. She saw it raging in the palm of someone's hand, a fist clenching it tight to prevent it from spreading and once again consuming the world.</p>
    </text></page>
    <page class="verySlowFadeOut"><text class="full center">
      <p>Natalie dreamt of fire.</p>
      <p>Not the tame fire of a lantern, or even the fierce danger of a forest fire - no, her dream was of Fire, the blaze with which the gods made the stars, or with which they burned the skies and scorched the land baren three thousand years ago. She saw it raging in the palm of someone's hand, a fist clenching it tight to prevent it from spreading and once again consuming the world.</p>
      <p>She also dreamt of Ocean, vast stretches of water separting pinpricks of land. In her dream she knew the ocean was waiting for her, waiting for her to see something no one else has ever seen before, and that no one will ever see again as storms wipe the land clean.</p>
    </text></page>
    <page class="verySlowFadeOut"><text class="full center">
      <p>Natalie dreamt of fire.</p>
      <p>Not the tame fire of a lantern, or even the fierce danger of a forest fire - no, her dream was of Fire, the blaze with which the gods made the stars, or with which they burned the skies and scorched the land baren three thousand years ago. She saw it raging in the palm of someone's hand, a fist clenching it tight to prevent it from spreading and once again consuming the world.</p>
      <p>She also dreamt of Ocean, vast stretches of water separting pinpricks of land. In her dream she knew the ocean was waiting for her, waiting for her to see something no one else has ever seen before, and that no one will ever see again as storms wipe the land clean.</p>
      <p>And she dreamt of love. Neither fire nor water, she finally had a body, and in her heart grew a secret warmth that even the end of the world could not smother. Her secret love could neither be burned nor drowned, and it would flower into a beautiful life, if only it would grow large enough, surrounded by chaos and flood and storm. Natalie curled around it protectively...</p>
    </text></page>
    <page bg="#{@Ship.images.cabinDay}" class="verySlowFadeIn">
      <text>
        <p>Thud.</p>
      </text>
    </page>
    <page>
      <text>
        <p>Thud.</p>
        <p>The dream ended abruptly as she fell off the bed. Groggy and disoriented, but finally awake, she rubbed her head and opened her eyes. Morning light. She stumbled to her feet, grabbing the edge of her bed for support as the ship rocked beneath her. The roll of the Lapis Azurai was gentle, calming even, chasing away fraying fragments of her dreams, a reminder of where and who she was.</p>
      </text>
    </page>
    <page>
      <text>
        <p>On a ship. On her ship. Captain Natalie – she liked the sound of that. Provisional captain – if she brought it back from its maiden voyage, then she'd have earned the rank for real. If she didn't bring it back... well, not much use thinking about that. Nearly a tenth of the vessels that set sail sank, all hands lost. The ocean was not safe.</p>
      </text>
    </page>
    <page>
      <text>
        <p>Not her though. This was her ship. It would come back, with her aboard, not just the first time, but every time.</p>
      </text>
    </page>
    <page>
      #{@Nat.image 'normal', 'left'}
      <text>
        <p>Grinning at the thought of herself in wrinkles and walking with a cane – as if! - she brushed #{dropdown hairColor, @Nat.color[2]} hair out of her eyes and examined herself in the mirror. #{dropdown eyeColor, @Nat.color[1]} eyes, still sleepy. She slapped her #{dropdown skinColor, @Nat.color[0]} cheeks and stuck her tongue out at the reflection. There were old sailors and old captains, good enough or lucky enough, and she was going to be one of them. No cane though.</p>
      </text>
    </page>""")

    element.find('input').change =>
      # Update each layer with a new HSL value
      checked = $ 'input:checked', element
      @context.Nat.color = [
        checked.eq(2).val()
        checked.eq(1).val()
        checked.eq(0).val()
        'none'
      ]

      # Now update the image (including invalidating the cache)
      $('.person', element).replaceWith @context.Nat.image 'normal', 'left', false

    return element

Page.Intro::next = Page.Intro2 = class Intro2 extends Page
  conditions:
    James: '|officers|James'
    Nat: '|officers|Nat'
    Ship: '|map|Ship'
    Vailia: '|map|Vailia'
  text: -> """<page bg="#{@Ship.images.cabinDay}">
    #{@Nat.image 'normal', 'left'}
    <text>
      <p>#{q @James}Nat! You ok?</q> James called in on her.</p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'left'}
    <text>
      <p>#{q @James}Nat! You ok?</q> James called in on her.</p>
      <p>#{q @Nat}Yeah, fine.</q></p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'left'}
    <text>
      <p>#{q @James}Nat! You ok?</q> James called in on her.</p>
      <p>#{q @Nat}Yeah, fine.</q></p>
      <p>#{q @James}I heard you thumping around.</q></p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'left'}
    <text>
      <p>#{q @James}Nat! You ok?</q> James called in on her.</p>
      <p>#{q @Nat}Yeah, fine.</q></p>
      <p>#{q @James}I heard you thumping around.</q></p>
      <p>#{q @Nat}“It's nothing. How much time do we have?</q> She splashed water on her face, dried it off again with a towel.</p>
    </text>
  </page>
  <page class="slowFadeOut">
    <text>
      <p>#{q @James}Should have left ten minutes ago!</q> He hadn't woken her up though – Natalie had learned long ago that James would worry himself sick at the slightest excuse, but it wasn't until he was practically vibrating with impatience that she actually needed to hurry.</p>
    </text>
  </page>
  <page bg="#{@Ship.images.deckDay}" class="slowFadeIn">
    #{@Nat.image 'normal', 'left'}
    <text>
      <p>#{q}I don't believe you,</q> she opened the door, stepping out to join him on deck. #{q}You were rather drunk last night. How are your eyes not red?</q> Natalie poked James in the forehead, causing him to wince. #{q}I knew it, you just woke up too.</q></p>
    </text>
  </page>
  <page>
    #{@James.image 'blush', 'right'}
    <text>
      <p>#{q @Nat}I don't believe you,</q> she opened the door, stepping out to join him on deck. #{q}You were rather drunk last night. How are your eyes not red?</q> Natalie poked James in the forehead, causing him to wince. #{q}I knew it, you just woke up too.</q></p>
      <p>He shook his head, trying to deny it, but she quirked an eyebrow, and he finally relented with a nod. #{q @James}Hey, it was our very first night on your brand new ship. A little drinking seemed in order.</q></p>
    </text>
  </page>
  <page>
    #{@Nat.image 'excited', 'left'}
    <text>
      <p>#{q}Never said it wasn't. Now, come on, I want breakfast before we meet with the Guildmaster.</q></p>
    </text>
  </page>
  <page>
    #{@James.image 'normal', 'right'}
    <text>
      <p>#{q @Nat}Never said it wasn't. Now, come on, I want breakfast before we meet with the Guildmaster.</q></p>
      <p>#{q @James}Should have left half an hour ago,</q> he grumbled, and followed.</p>
    </text>
  </page>
  """
  effects:
    add:
      '|missions|meet': Mission.MeetGuildmaster
      '|location|jobs|visit': Job.IntroVisitGuildmaster
  next: Page.Port


Job.IntroVisitGuildmaster::next = Page.IntroVisitGuildmaster = class IntroVisitGuildmaster extends Page
  conditions:
    James: '|officers|James'
    Nat: '|officers|Nat'
    Guildmaster: '|people|Guildmaster'
    Vailia: '|map|Vailia'
  text: ->"""<page bg="#{@Vailia.images.guildOffice}">
    <text>
      <p>The Guild.</p>
    </text>
  </page>
  <page>
    <text>
      <p>The Guild.</p>
      <p>James hesitated at the doors, then hurried to join her when Natalie shot him an impatient look. The lobby was rather busy this morning – preparations for the annual festival of lights, the longest day of the year made even longer by a celebration that ran through the night.</p>
    </text>
  </page>
  <page>
    <text>
      <p><q>The Guildmaster is waiting for you in his office,</q> the young man at the front desk prompted, sounding a little envious. Though Natalie was barely a year older than him, that she'd have the attention of the Guildmaster was unusual, to say the least. He'd never even spoken with many of the "Guild children."</p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'left'}
    <text>
      <p><q>The Guildmaster is waiting for you in his office,</q> the young man at the front desk prompted, sounding a little envious. Though Natalie was barely a year older than him, that she'd have the attention of the Guildmaster was unusual, to say the least. He'd never even spoken with many of the "Guild children."</p>
      <p>#{q}Thanks. Light a candle for me,</q> she leaned over the desk and pinched his cheek. #{q @Nat}I'm going to have to miss the festival this year.</q></p>
    </text>
  </page>
  <page>
    <text>
      <p><q>The Guildmaster is waiting for you in his office,</q> the young man at the front desk prompted, sounding a little envious. Though Natalie was barely a year older than him, that she'd have the attention of the Guildmaster was unusual, to say the least. He'd never even spoken with many of the "Guild children."</p>
      <p>#{q}Thanks. Light a candle for me,</q> she leaned over the desk and pinched his cheek. #{q @Nat}I'm going to have to miss the festival this year.</q></p>
      <p><q>Will do, Nat,</q> he swatted away her hand with a grin. Envious or not, those lifted off the streets and raised together looked out for their own.</p>
    </text>
  </page>
  <page>
    #{@Guildmaster.image 'normal', 'right'}
    <text>
      <p>Janos looked up as Natalie entered, trailed a moment later by James. Though he had assistants to handle all the papers necessary, still he preferred to touch at least some of that work himself, to understand the details and not merely the overview of the Guild's operations. Natalie briefly saw a column of figures – expenses, deposits – before he leaned forward, covering it with one arm.</p>
    </text>
  </page>
  <page>
    #{@Guildmaster.image 'smiling', 'right'}
    <text>
      <p>#{q}Please, I'm not going to bite. James Thadel, is it? I understand you're to be Natalie's first mate?</q></p>
    </text>
  </page>
  <page>
    #{@James.image 'blush', 'left'}
    <text>
      <p>#{q @Guildmaster}Please, I'm not going to bite. James Thadel, is it? I understand you're to be Natalie's first mate?</q></p>
      <p>#{q @James}Sorry sir, yes sir,</q> James stood up straighter, self consciously moving out from his position half hidden behind her. #{q @James}Quartermaster, actually.</q></p>
    </text>
  </page>
  <page>
    #{@Guildmaster.image 'normal', 'right'}
    <text>
      <p>#{q}Please take as good care of her as we have,</q> he gestured to a pair of chairs in front of his desk. Natalie relaxed into hers, while James perched on the edge. It was his first time meeting Janos, and she couldn't help but chuckle at his nervousness. She'd been awed too, at her first encounter with one of the second most powerful man in the city – but eight year old Natalie had gotten over that nervousness by promptly sitting in his lap, rather than the offered chair. She smiled at the memory. He'd approved, as Wend had said he would, rather than scolding her.</p>
    </text>
  </page>
  <page>
    #{@Guildmaster.image 'normal', 'right'}
    <text>
      <p>#{q}Please take as good care of her as we have,</q> he gestured to a pair of chairs in front of his desk. Natalie relaxed into hers, while James perched on the edge. It was his first time meeting Janos, and she couldn't help but chuckle at his nervousness. She'd been awed too, at her first encounter with one of the second most powerful man in the city – but eight year old Natalie had gotten over that nervousness by promptly sitting in his lap, rather than the offered chair. She smiled at the memory. He'd approved, as Wend had said he would, rather than scolding her.</p>
      <p>#{q}When do you set sail?</q></p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'left'}
    <text>
      <p>#{q}Soon. Two, three days. We've finished going over every inch of planking, and the initial trials around the island went well – please thank Captain Johnson for assisting us with that, if you see him. I have discussed prices for our first cargo with...</q> Natalie listed off the preparations she'd made for departure, while Janos listened attentively, interjecting occasionally with tidbits of advice. He was one of the finest business minds in the city, and it comforted her to know that he would catch anything she'd forgotten to do. Which was, she suspected, the actual point of this meeting – protecting his investment. Managing a merchant ship was not the Guild's usual line of business.</p>
    </text>
  </page>
  <page>
    #{@Guildmaster.image 'thinking', 'right'}
    <text>
      <p>#{q}Very thorough. I have nothing more to add.</q> He jotted down a note, and nodded.</p>
    </text>
  </page>
  <page>
    #{@Nat.image 'excited', 'center'}
    <text>
      <p>#{q}Very thorough. I have nothing more to add.</q> He jotted down a note, and nodded.</p>
      <p>Natalie grinned at that – as much approval as he ever showed of anything. Impulsively she stood and leaned over the desk, planting a kiss on his cheek before he could say anything. She quickly retreated back to her seat, sitting on her hands lest they do anything else untoward.</p>
    </text>
  </page>
  <page>
    #{@Guildmaster.image 'normal', 'right'}
    <text>
      <p>#{q}Very thorough. I have nothing more to add.</q> He jotted down a note, and nodded.</p>
      <p>Natalie grinned at that – as much approval as he ever showed of anything. Impulsively she stood and leaned over the desk, planting a kiss on his cheek before he could say anything. She quickly retreated back to her seat, sitting on her hands lest they do anything else untoward.</p>
      <p>#{q}Please let me know when you return.</q> He didn't react to her gesture, other than to adjust a stack of papers back into place, but she suspected he was pleased. Hard to tell, with the Guildmaster. She also knew a dismissal when she heard one.</p>
  """
  effects:
    remove:
      '|missions|meet': Mission.MeetGuildmaster

Job.IntroSail::next = Page.IntroSail = class IntroSail extends Page
  conditions:
    James: {}
    Nat: {}
    Ship: '|map|Ship'
  text: ->"""<page bg="#{@Ship.images.cabinDay}">
    #{@Nat.image 'normal', 'right'}
    <text>
      <p>#{q}If you're going to fill the room with dread, at least enter all the way,</q> Natalie laid aside her pen and admonished him. James started guiltily, and stepped into her bedroom, closing the door behind him with a foot. He remained standing – other than the chair she occupied, the only place to sit would be on her bed, and he wasn't the sort to be comfortable with that. The space was cramped, but a private room was still more than most people aboard a ship this size would get, even the quartemaster. He'd have to share with first-mate, once they had one.</p>
    </text>
  </page>
  <page>
    #{@James.image 'normal', 'left'}
    <text>
      <p>#{q}Nat...</q> he trailed off, then started again. #{q}I'm not sure I can do this.</q></p>
    </text>
  </page>
  <page>
    #{@Nat.image 'upset', 'right'}
    <text>
      <p>#{q @James}Nat...</q> he trailed off, then started again. #{q}I'm not sure I can do this.</q></p>
      <p>She waited for him to go on, but he didn't, just fidgeted and leaned against the door to resist the swell and roll of the deck beneath them. #{q @Nat}What can't you do?</q> Timber creaked, adjusting to new stresses.</p>
      <p>#{q}We're four days out, fifty kilometers from the nearest land. It's a bit late for second thoughts now.</q></p>
    </text>
  </page>
  <page>
    #{@James.image 'upset', 'left'}
    <text>
      <p>#{q}I know, I know, it's just... I can't shake this feeling of doom. Do you know how many ships survive a storm? I did some figuring – it's less than a third, if you get caught out to sea.</q></p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'right'}
    <text>
      <p>#{q @James}I know, I know, it's just... I can't shake this feeling of doom. Do you know how many ships survive a storm? I did some figuring – it's less than a third, if you get caught out to sea.</q></p>
      <p>Natalie stood and moved over to the bed, patting the chair and indicating that he should take the seat. #{q @Nat}The Azurai is a good ship. She'll see us through. The shipwrights knew what they were doing when they built her. She may be small, but she's fast and sturdy.</q> She patted his knee, attempting to reassure him of something she wasn't entirely sure of herself.</p>
    </text>
  </page>
  <page>
    #{@James.image 'normal', 'left'}
    <text>
      <p>#{q}What are we even doing here, Natalie? There's plenty of opportunity back home, without risking our lives.</q></p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'right'}
    <text>
      <p>#{q @James}What are we even doing here, Natalie? There's plenty of opportunity back home, without risking our lives.</q></p>
      <p>#{q @Nat}You have a future in Vailia, and I never asked you to give it up. It's not my future. I don't have anyone to hand me a house and a trade. James, do you know what I'd be doing, right now, if I weren't a captain?</q></p>
    </text>
  </page>
  <page>
    #{@James.image 'blush', 'left'}
    <text>
      <p>Red crept along his cheeks as he considered the question. Natalie was too small and too smart to desire any form of manual labor, and too poor to set herself up in any other trade. Young, attractive, raised by the Guild... really, there was only one way to that question. She'd be selling her body, same as every other Vailian girl her age pretty enough to make the grade.</p>
      <p>#{q}I, ah, sorry,</q> he apologized lamely.</p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'right'}
    <text>
      <p>#{q}Don't be. I chose this, you chose this, and if we'd chosen differently, we'd be different.</q> She poked his forehead, trying to break the mood before he turned into a beet. It had happened before, if she teased him about sex too much, but now wasn't the time.</p>
    </text>
  </page>
  <page>
    #{@James.image 'blush', 'left'}
    <text>
      <p>#{q @Nat}Don't be. I chose this, you chose this, and if we'd chosen differently, we'd be different.</q> She poked his forehead, trying to break the mood before he turned into a beet. It had happened before, if she teased him about sex too much, but now wasn't the time.</p>
      <p>#{q @James}I suppose so,</q> he rubbed his forehead, rolled his shoulders, stood up. Despite his slight frame, Natalie know just how strong he was – one wasn't born as a blacksmith's son without working up some strength.</p>
    </text>
  </page>
  <page>
    #{@Nat.image 'normal', 'right'}
    <text>
      <p>#{q}Don't be. I chose this, you chose this, and if we'd chosen differently, things would be different.</q> She poked his forehead, trying to break the mood before he turned into a beet. It had happened before, if she teased him about sex too much, but now wasn't the time.</p>
      <p>#{q @James}I suppose so,</q> he rubbed his forehead, rolled his shoulders, stood up. Despite his slight frame, Natalie knew just how strong he was – one wasn't born as a blacksmith's son without working up some strength.</p>
      <p>#{q @Nat}Have a good night. Stop worrying.</q> She looked away and picked up her pen again.</p>
    </text>
  </page>
  """
  apply: ->
    g.location = g.map.Vailia
  effects:
    remove:
      '|missions|crewCargo': Mission.CrewCargo
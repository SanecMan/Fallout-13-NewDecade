var/list/translit_symbols = list("а" = "a", "б" = "b", "в" = "v", "г" = "g", "д" = "d", "е" = "e", "ё" = "yo", "ж"= "j", "з" = "z", "и" = "i", \
 "й" = "y", "к" = "k", "л" = "l", "м" = "m", "н" = "n", "о" = "o", "п" = "p", "р" = "r", "с" = "c", "т" = "t", "у" = "y", \
 "ф" = "f", "х" = "h", "ц" = "tc", "ч" = "ch", "ш" = "sh", "щ" = "sh", "ы" = "i", "э" = "e", "ю" = "yu", "я" = "ya", \
 "ь" = "", "ъ" = "")
var/static/list/phrases_storage = list("attack" = "assault,sic,strike,rush,charge,bit,target,open,fuck,фас,мочи,вали,кус,цап,бей,атак,ебаш,штурм,уеб,хоп", "follow" = "come,to me,after,with,escort,convoy,chase,пиздуй,иди,сюда,ко мне,к ноге,рядом,за мной,пров,конв,след,вперед", \
"stop" = "quit,leave,drop,freeze,pause,cease,layoff,хватит,стоп,остановись,харе,перестань,прекрат,фу,нет,нельзя,брос,вольно,свобод", "stay" = "wait,hold,still,idle,стоять,стой,мест,не двигайся", \
"randy" = "rand,рэнд,ренд", "bear" = "grizzly,миш,медвед,косолап", "brahmin" = "cow,брамин,коров,му", \
"me" = "my,mine,меня,мной,я,мне", "anybody" = "every,each,all,все,кажд", "dance" = "танц,пляши", "defend" = "guard,protect,secur,enforce,watch,защищ,защит,берег,хран,сторож", \
"none" = "neutral,wasteland,settler,farm,нейтрал,пустош,поселен,дерев,ферм,бомж", "city" = "citiz,mayor,sherif,город,мер,мэр,шериф,шэриф", "raiders" = "bandit,criminal,raid,gang,psych,insane,maniac,sadist,рейд,хулиг,банд,пахан,псих,шиз,мани,садист,содом", "vault" = "bunker,убежищ,бункер", "bs" = "bro,steel,knight,paladin,elder,брат,стал,рыцар,паладин,старейшин", "enclave" = "usa,сша,анклав", "ahs" = "hubolog,adept,хаболог,адепт", "ncr" = "california,republic,нкр,калифорни,республик", "legion" = "caesar,легион,цезарь", "followers" = "follower,apocalypse,следовате,апокалипсис", "acolytes" = "acolyt,atom,ghoul,аколит,атом,гул", \
"enemy" = "foe,bad,bully,evil,danger,threat,monster,asshole,fag,traitor,villain,dick,douche,prick,spy,agent,враг,чуж,плох,зло,опас,угр,пред,шпи,враж,сволоч,муд,пидор", \
"friend" = "buddy,master,good,kind,ally,partner,друг,друз,добр,повел,хоз,хор,союз,пар", "pull" = "grab,bring,get,drag,fetch,take,haul,tow,deliver,rescue,save,help,апорт,тащи,неси,нест,хват,возьми,взя,заложи,спас,букс", \
"doge" = "dog,pup,hound,mongrel,pooch,bowwow,псин,пёс,собак,кобел,щен,пса,шавк,волк", \
"smeagol" = "gollum,hobbit,смегол,лысый,гол,гор,урод,хобит,пучеглаз", \
"brutus" = "брут", \
"democratie" = "демократия", \
"stalin" = "сталин")


proc/translit(text)
	return sanitize_simple(text, translit_symbols)

proc/parse_phrase(text, name)
	if(findtext_char(text,name))
		return 1
	if(name in phrases_storage)
		var/names = phrases_storage[name]
		names = splittext_char(names,",")
		for(var/N in names)
			if(findtext_char(text,"[N]"))
				return 1
	var/translit = translit(text)
	if(findtext_char(translit,name))
		if(phrases_storage[name])
			phrases_storage[name] += ",[translit]"
		else
			phrases_storage[name] = translit
		return 1
	return 0
from enum import Enum


class Color(Enum):
	TRANSPARENT = 0
	ROUGE = 1

def motus(reference:str, tentative:str) -> list[Color]:

	une_liste = []
	for refchar, tentchar in zip(reference, tentative):
		if refchar == tentchar:
			 une_liste.append(Color.ROUGE)
		else:
			une_liste.append(Color.TRANSPARENT)
	return une_liste

	# if reference == "BA" and tentative == "DA":
	# 	return [Color.TRANSPARENT, Color.ROUGE]
	# if reference == "AB" and tentative == "AD":
	# 	return [Color.ROUGE, Color.TRANSPARENT]
	#
	# if reference == "":
	# 	return []
	#
	# if reference == tentative:
	# 	return [Color.ROUGE]*len(tentative)
	#
	# return [Color.TRANSPARENT]*len(tentative)


def test_motus():
	assert motus("", "") == []
	assert motus("A", "B") == [Color.TRANSPARENT]
	assert motus("A", "A") == [Color.ROUGE]
	assert motus("AB", "CD") == [Color.TRANSPARENT, Color.TRANSPARENT]
	assert motus("BA", "DC") == [Color.TRANSPARENT, Color.TRANSPARENT]
	assert motus("EF", "EF") == [Color.ROUGE, Color.ROUGE]
	assert motus("AB", "AD") == [Color.ROUGE, Color.TRANSPARENT]
	assert motus("BA", "DA") == [Color.TRANSPARENT, Color.ROUGE]



test_motus()
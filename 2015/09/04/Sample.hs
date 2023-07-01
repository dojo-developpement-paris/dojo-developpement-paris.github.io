module Sample
where

data City = Blaxhall|Clacton|Dunwich|Feering|Harwich|Maldon|Tiptree
    deriving (Show,Eq,Ord,Enum)

roads = [(Blaxhall,[(Dunwich,15),(Feering,46),(Harwich,40)])
        ,(Clacton,[(Harwich,17),(Maldon,40),(Tiptree,29)])
        ,(Dunwich,[(Blaxhall,15),(Harwich,53)])
        ,(Feering,[(Blaxhall,46),(Maldon,11),(Tiptree,3)])
        ,(Harwich,[(Blaxhall,40),(Clacton,17),(Dunwich,53),(Tiptree,31)])
        ,(Maldon,[(Clacton,40),(Feering,11),(Tiptree,8)])
        ,(Tiptree,[(Clacton,29),(Feering,3),(Harwich,31),(Maldon,8)])]

      

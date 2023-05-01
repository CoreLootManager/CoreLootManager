item = "|cffa335ee|Hitem:195482::::::::1:1447::3:1:3524:1:28:2158:::::|h[Decorated Commander's Cindercloak]|h|r"
# payload = item.split("|H")[1].split("|h")[0].split(":")
# print(payload)

    # itemID=False
    # enchantID=False
    # gemID1=False
    # gemID2=False
    # gemID3=False
    # gemID4=False
    # suffixID=False
    # uniqueID=False
    # linkLevel=False
    # specializationID=False
    # modifiersMask=False
    # itemContext=False
    # numBonusIDs=True
    # # [:bonusID1:bonusID2:...]
    # numModifiers=True ### TODO this one actually will have double the amount i think???
    # # [:modifierType1:modifierValue1:...]
    # relic1NumBonusIDs=True
    # # [:relicBonusID1:relicBonusID2:...]
    # relic2NumBonusIDs=True
    # # [:relicBonusID1:relicBonusID2:...]
    # relic3NumBonusIDs=True
    # # [:relicBonusID1:relicBonusID2:...]
    # crafterGUID=False
    # extraEnchantID=False

from collections import OrderedDict

class ItemLinkDecoder:
    class Field:
        def __init__(self, is_compound : bool, compound_field_multiplier: int=1) -> None:
            self.__is_compound = is_compound
            self.__compound_data = []
            self.__compound_field_multiplier = compound_field_multiplier

        def set_data(self, data: any) -> None:
            self.__data = data

        def add_compund_data(self, data: any) -> None:
            if not self.__is_compound:
                raise Exception("Adding compound data to non-compund field")
            self.__compound_data.append(data)

        def get_length(self) -> int:
            return len(self.__compound_data) + 1
        
        def is_compound(self) -> bool:
            return self.__is_compound
        
        def get_data(self) -> any:
            return self.__data
        
        def get_compound_data(self) -> list:
            return self.__compound_data
        
        def get_expected_amount_of_compound_data(self):
            num_subfields = 0
            try:
                num_subfields = int(self.__data)
            except ValueError:
                pass
            return num_subfields * self.__compound_field_multiplier

    def __init__(self, item_string : str):
        self.__item_string = item_string
        self.__item_name = self.__item_string.split("|h")[1]
        self.__payload_string = self.__item_string.split("|H")[1].split("|h")[0]
        self.__payload = self.__payload_string.split(":")
        self.__setup_fields()
        self.__parse()

    def __setup_fields(self):
        self.__fields:OrderedDict[str, ItemLinkDecoder.Field] = OrderedDict()

        self.__fields["itemID"]             = ItemLinkDecoder.Field(False)
        self.__fields["enchantID"]          = ItemLinkDecoder.Field(False)
        self.__fields["gemID1"]             = ItemLinkDecoder.Field(False)
        self.__fields["gemID2"]             = ItemLinkDecoder.Field(False)
        self.__fields["gemID3"]             = ItemLinkDecoder.Field(False)
        self.__fields["gemID4"]             = ItemLinkDecoder.Field(False)
        self.__fields["suffixID"]           = ItemLinkDecoder.Field(False)
        self.__fields["uniqueID"]           = ItemLinkDecoder.Field(False)
        self.__fields["linkLevel"]          = ItemLinkDecoder.Field(False)
        self.__fields["specializationID"]   = ItemLinkDecoder.Field(False)
        self.__fields["modifiersMask"]      = ItemLinkDecoder.Field(False)
        self.__fields["itemContext"]        = ItemLinkDecoder.Field(False)
        self.__fields["numBonusIDs"]        = ItemLinkDecoder.Field(True)
        self.__fields["numModifiers"]       = ItemLinkDecoder.Field(True, 2)
        self.__fields["relic1NumBonusIDs"]  = ItemLinkDecoder.Field(True)
        self.__fields["relic2NumBonusIDs"]  = ItemLinkDecoder.Field(True)
        self.__fields["relic3NumBonusIDs"]  = ItemLinkDecoder.Field(True)
        self.__fields["crafterGUID"]        = ItemLinkDecoder.Field(False)
        self.__fields["extraEnchantID"]     = ItemLinkDecoder.Field(False)

    def __parse(self):
        if self.__payload[0] != "item":
            raise Exception("Invalid item link")
        print("Item Name: {0}".format(self.__item_name))
        payload_iterator = iter(self.__payload[1:])
        for field_name, field in self.__fields.items():
            payload = next(payload_iterator)
            if field.is_compound():
                field.set_data(payload)
                # print("Compound field {0} with {1} subfields".format(field_name, field.get_expected_amount_of_compound_data()))
                for _ in range(0, field.get_expected_amount_of_compound_data()):
                    field.add_compund_data(next(payload_iterator))
            else:
                field.set_data(payload)
            
            text = "Field {0} = {1}".format(field_name, field.get_data())
            if field.is_compound():
                text += "["
                for value in field.get_compound_data():
                    text += value + " "
                text = text.rstrip(" ")
                text +="]"
            print(text)
        
decoded = ItemLinkDecoder(item)
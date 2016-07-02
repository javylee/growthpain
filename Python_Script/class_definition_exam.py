# __*__ coding: utf-8 __*__


class AddrBookEntry(object):
    "My very first class: blackbook app"

    version = 1.0

    def __init__(self, nm, ph):
        self.name = nm
	self.phone = ph


    def updatePhone(self, newph):
        self.phone = newph


print 'AddrBookEntry().version = '+ str(AddrBookEntry.version)

an_instance = AddrBookEntry('javy','321')
an_instance.version = 1.1
#print an_instance.name,
print an_instance.phone
an_instance.updatePhone('123')
print an_instance.phone

instance2 = AddrBookEntry('javy','654')
print instance2.version,
print instance2.name,
print instance2.phone
instance2.updatePhone('456')
print 'instance2: '+instance2.phone
print 'an_instance: '+an_instance.phone
#print 'AddrBookEntry().version = '+ str(AddrBookEntry.version)


# Here below is an example of subclass

class emplAddrBookEntry(AddrBookEntry):

    def __init__(self, nm, ph, sex, age):
        AddrBookEntry.__init__(self, nm, ph)
	self.sex = sex
	self.age = age


    def updateAge(self,newAge):
        self.age = newAge




subclassins = emplAddrBookEntry('lee','123456','male','34')
print subclassins.name,
print subclassins.phone,
print subclassins.sex,
print subclassins.age

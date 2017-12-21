CXX = g++
CPPFLAGS = -Wall -g
PATH_LIB = ./Library
PATH_LIB_CTML = $(PATH_LIB)/CTML
PATH_CLASS = ./Class
CLASS_TELEPHONE_NUMBER = telephone_number
CLASS_CONTACT = contact
CLASS_SMS = sms
CLASS_UTILS_HTML = utils_html
DIR_OBJ = ./Obj
DIR_SMS_PER_CONTACT_DOCS = ./Sms
FILE_CONTACTS_HTML = contactsReportResult.html
FILE_SMS_HTML = smsReportResult.html
MAIN = phoneContactsReport
EXE = phoneContactsReport

all: $(DIR_OBJ) $(DIR_SMS_PER_CONTACT_DOCS) $(EXE)

$(DIR_OBJ):
	mkdir -m 755 $(DIR_OBJ)

$(DIR_SMS_PER_CONTACT_DOCS):
	mkdir -m 755 $(DIR_SMS_PER_CONTACT_DOCS)

$(EXE): $(MAIN).cpp $(CLASS_TELEPHONE_NUMBER).o $(CLASS_CONTACT).o $(CLASS_SMS).o $(CLASS_UTILS_HTML).o
	$(CXX) $(CPPFLAGS) -I$(PATH_LIB_CTML) -I$(PATH_CLASS) $(DIR_OBJ)/$(CLASS_TELEPHONE_NUMBER).o $(DIR_OBJ)/$(CLASS_CONTACT).o $(DIR_OBJ)/$(CLASS_SMS).o $(DIR_OBJ)/$(CLASS_UTILS_HTML).o $(MAIN).cpp -o $(EXE)

$(CLASS_TELEPHONE_NUMBER).o:
	$(CXX) -c $(CPPFLAGS) $(PATH_CLASS)/$(CLASS_TELEPHONE_NUMBER).cpp -o $(DIR_OBJ)/$(CLASS_TELEPHONE_NUMBER).o

$(CLASS_CONTACT).o:
	$(CXX) -c $(CPPFLAGS) $(PATH_CLASS)/$(CLASS_CONTACT).cpp -o $(DIR_OBJ)/$(CLASS_CONTACT).o

$(CLASS_SMS).o:
	$(CXX) -c $(CPPFLAGS) $(PATH_CLASS)/$(CLASS_SMS).cpp -o $(DIR_OBJ)/$(CLASS_SMS).o

$(CLASS_UTILS_HTML).o:
	$(CXX) -c $(CPPFLAGS) -I$(PATH_LIB_CTML) $(PATH_CLASS)/$(CLASS_UTILS_HTML).cpp -o $(DIR_OBJ)/$(CLASS_UTILS_HTML).o

clean:
	rm -Rf $(FILE_CONTACTS_HTML) $(FILE_SMS_HTML) $(DIR_SMS_PER_CONTACT_DOCS)

clean-all: clean
	rm -Rf $(EXE) $(DIR_OBJ)


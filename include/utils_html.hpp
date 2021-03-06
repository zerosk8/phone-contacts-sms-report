#ifndef _UTILS_HTML_HPP_
#define _UTILS_HTML_HPP_
#include <string>
#include <string.h>
#include "CTML.h"
#include "contact.hpp"
#include "sms.hpp"

// NOT "using namespace std;" BECAUSE OF THIS
// https://stackoverflow.com/questions/5527665/why-am-i-getting-string-does-not-name-a-type-error

class UtilsHtml
{
    public:
        static void HtmlWriteDocumentHead(CTML::Document & htmlDocument,
            const std::string & characterCodification, const std::string & viewport,
            const std::string & author, const std::vector<std::string> & styleSheetsPaths,
            const std::string & title);
        static void HtmlWriteHeaderInDocumentBody(CTML::Document & htmlDocument,
            const std::string & headerTitle,
            const std::vector<std::pair<std::string,std::string>> & listOfNavigationBarLinksNamesAndUrls,
            const unsigned int & indexOfSelectedNavigationBarLink);
        static void HtmlWriteSmsReportResultInDocumentBody(CTML::Document & htmlDocument,
            const std::string & headerTitle, std::vector<Sms> listOfSms);
        static void HtmlWriteContactsReportResultInDocumentBody(CTML::Document & htmlDocument,
            const std::string & headerTitle, std::vector<Contact> listOfContacts,
            const std::string & directoryPathForSmsPerContactDocuments,
            const std::string & fileExtensionHtml);
        static void HtmlWriteScriptsInDocumentBody(CTML::Document & htmlDocument,
            const std::vector<std::string> & listOfHtmlScriptsPaths);
    private:
        static std::string HtmlGetNumberOfObjectsMessage(const unsigned int & numberOfObjects,
            const bool & isContactsReportResult);
        static std::pair<CTML::Node,CTML::Node> HtmGetContactsNavigationBarNodeAndContactsListNode(
            std::vector<Contact> listOfContacts,
            const std::string & directoryPathForSmsPerContactDocuments,
            const std::string & fileExtensionHtml);
        static void InitializeAndAppendNodes(char & firstLetterOfName,
            const std::string & contactName,CTML::Node & htmlNavigation,
            CTML::Node & htmlContainerForAllContacts, CTML::Node * htmlRowOfContacts);
        static CTML::Node HtmlGetContactNode(const std::vector<Contact>::iterator & contactIterator,
            const std::string & directoryPathForSmsPerContactDocuments,
            const std::string & fileExtensionHtml);
        static std::string HtmlGetTelephoneNumberString(TelephoneNumber phoneNumber);
        static std::string HtmlGetSmsTypeString(const SmsType & type);
        static CTML::Node GetSmsNode(const std::vector<Contact>::iterator & contactIterator,
            const std::string & directoryPathForSmsPerContactDocuments,
            const std::string & fileExtensionHtml);
};

#endif
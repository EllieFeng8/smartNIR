//
// Created by fengl on 2026/6/3.
//
#pragma once
#include <QObject>
#include <QQmlEngine>
#include <QString>
#include <sstream>
#include <iomanip>
#include <QVariantList>
#include <string>
#include <QDir>
#include <QGuiApplication>
#include <QFile>
#include <QFileInfo>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QTextStream>
#include <QCoreApplication>
#include <QDebug>
#ifndef SMARTNIRAPP_SMARTNIRPROXY_H
#define SMARTNIRAPP_SMARTNIRPROXY_H

class SmartnirProxy : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString title READ getTitle WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString version READ getVersion WRITE setVersion NOTIFY versionChanged)
    Q_PROPERTY(QString nodeName READ getNodeName WRITE setNodeName NOTIFY nodeNameChanged)

    Q_PROPERTY(bool dashboardBtn READ getDashboardBtn WRITE setDashboardBtn NOTIFY dashboardBtnChanged)
    Q_PROPERTY(bool historyBtn READ getHistoryBtn WRITE setHistoryBtn NOTIFY historyBtnChanged)
    Q_PROPERTY(bool settingsBtn READ getSettingsBtn WRITE setSettingsBtn NOTIFY settingsBtnChanged)
    Q_PROPERTY(bool engineeringBtn READ getEngineeringBtn WRITE setEngineeringBtn NOTIFY engineeringBtnChanged)
    Q_PROPERTY(bool quickBtn READ getQuickBtn WRITE setQuickBtn NOTIFY quickBtnChanged)
    Q_PROPERTY(bool supportBtn READ getSupportBtn WRITE setSupportBtn NOTIFY supportBtnChanged)

    Q_PROPERTY(QString spectrumRange READ getSpectrumRange WRITE setSpectrumRange NOTIFY spectrumRangeChanged)
    Q_PROPERTY(double integTime READ getIntegTime WRITE setIntegTime NOTIFY integTimeChanged)
    Q_PROPERTY(QVariantList chartData READ getChartData WRITE setChartData NOTIFY chartDataChanged)

    Q_PROPERTY(double fat READ getFat WRITE setFat NOTIFY fatChanged)
    Q_PROPERTY(double protein READ getProtein WRITE setProtein NOTIFY proteinChanged)
    Q_PROPERTY(double water READ getWater WRITE setWater NOTIFY waterChanged)

    Q_PROPERTY(QString field1 READ getField1 WRITE setField1 NOTIFY field1Changed)
    Q_PROPERTY(QString field2 READ getField2 WRITE setField2 NOTIFY field2Changed)
    Q_PROPERTY(QString field3 READ getField3 WRITE setField3 NOTIFY field3Changed)

    Q_PROPERTY(bool whiteBtn READ getWhiteBtn WRITE setWhiteBtn NOTIFY whiteBtnChanged)
    Q_PROPERTY(bool measureBtn READ getMeasureBtn WRITE setMeasureBtn NOTIFY measureBtnChanged)
    Q_PROPERTY(bool itemBtn READ getItemBtn WRITE setItemBtn NOTIFY itemBtnChanged)
    Q_PROPERTY(QVariantList itemName READ getItemName WRITE setItemName NOTIFY itemNameChanged)

    Q_PROPERTY(QString dateRange READ getDateRange WRITE setDateRange NOTIFY dateRangeChanged)
    Q_PROPERTY(QString className READ getClassName WRITE setClassName NOTIFY classNameChanged)
    Q_PROPERTY(QString searchId READ getSearchId WRITE setSearchId NOTIFY searchIdChanged)

    Q_PROPERTY(bool dateBtn READ getDateBtn WRITE setDateBtn NOTIFY dateBtnChanged)
    Q_PROPERTY(bool classBtn READ getClassBtn WRITE setClassBtn NOTIFY classBtnChanged)
    Q_PROPERTY(bool exportBtn READ getExportBtn WRITE setExportBtn NOTIFY exportBtnChanged)

    Q_PROPERTY(QString pageTitle READ getPageTitle WRITE setPageTitle NOTIFY pageTitleChanged)
    Q_PROPERTY(QString streamText READ getStreamText WRITE setStreamText NOTIFY streamTextChanged)

    Q_PROPERTY(QVariantList logList READ getLogList WRITE setLogList NOTIFY logListChanged)

    Q_PROPERTY(int rowCount READ getRowCount WRITE setRowCount NOTIFY rowCountChanged)
    Q_PROPERTY(int pageIndex READ getPageIndex WRITE setPageIndex NOTIFY pageIndexChanged)

    Q_PROPERTY(bool prevBtn READ getPrevBtn WRITE setPrevBtn NOTIFY prevBtnChanged)
    Q_PROPERTY(bool nextBtn READ getNextBtn WRITE setNextBtn NOTIFY nextBtnChanged)
    Q_PROPERTY(bool page1Btn READ getPage1Btn WRITE setPage1Btn NOTIFY page1BtnChanged)
    Q_PROPERTY(bool page2Btn READ getPage2Btn WRITE setPage2Btn NOTIFY page2BtnChanged)
    Q_PROPERTY(bool page3Btn READ getPage3Btn WRITE setPage3Btn NOTIFY page3BtnChanged)

    Q_PROPERTY(QString recordText READ getRecordText WRITE setRecordText NOTIFY recordTextChanged)
    Q_PROPERTY(QString sensors READ getSensors WRITE setSensors NOTIFY sensorsChanged)
    Q_PROPERTY(double integrity READ getIntegrity WRITE setIntegrity NOTIFY integrityChanged)
    Q_PROPERTY(QString uptime READ getUptime WRITE setUptime NOTIFY uptimeChanged)
    Q_PROPERTY(QString nodeHealth READ getNodeHealth WRITE setNodeHealth NOTIFY nodeHealthChanged)

    Q_PROPERTY(int lightHealth READ getLightHealth WRITE setLightHealth NOTIFY lightHealthChanged)
    Q_PROPERTY(QString healthText READ getHealthText WRITE setHealthText NOTIFY healthTextChanged)
    Q_PROPERTY(bool healthOk READ getHealthOk WRITE setHealthOk NOTIFY healthOkChanged)

    Q_PROPERTY(bool specConnected READ getSpecConnected WRITE setSpecConnected NOTIFY specConnectedChanged)
    Q_PROPERTY(QString linkText READ getLinkText WRITE setLinkText NOTIFY linkTextChanged)
    Q_PROPERTY(QString termId READ getTermId WRITE setTermId NOTIFY termIdChanged)

    Q_PROPERTY(bool spectrumChk READ getSpectrumChk WRITE setSpectrumChk NOTIFY spectrumChkChanged)
    Q_PROPERTY(bool field1Chk READ getField1Chk WRITE setField1Chk NOTIFY field1ChkChanged)
    Q_PROPERTY(bool field2Chk READ getField2Chk WRITE setField2Chk NOTIFY field2ChkChanged)
    Q_PROPERTY(bool field3Chk READ getField3Chk WRITE setField3Chk NOTIFY field3ChkChanged)
    Q_PROPERTY(bool predictChk READ getPredictChk WRITE setPredictChk NOTIFY predictChkChanged)

    Q_PROPERTY(bool resetBtn READ getResetBtn WRITE setResetBtn NOTIFY resetBtnChanged)

    Q_PROPERTY(QString startDate READ getStartDate WRITE setStartDate NOTIFY startDateChanged)
    Q_PROPERTY(QString endDate READ getEndDate WRITE setEndDate NOTIFY endDateChanged)
    Q_PROPERTY(bool exportLogBtn READ getExportLogBtn WRITE setExportLogBtn NOTIFY exportLogBtnChanged)

    Q_PROPERTY(bool importBtn READ getImportBtn WRITE setImportBtn NOTIFY importBtnChanged)
    Q_PROPERTY(QString importText READ getImportText WRITE setImportText NOTIFY importTextChanged)

    Q_PROPERTY(QString field1Name READ getField1Name WRITE setField1Name NOTIFY field1NameChanged)
    Q_PROPERTY(QString field1Param READ getField1Param WRITE setField1Param NOTIFY field1ParamChanged)
    Q_PROPERTY(QString field1Value READ getField1Value WRITE setField1Value NOTIFY field1ValueChanged)

    Q_PROPERTY(QString field2Name READ getField2Name WRITE setField2Name NOTIFY field2NameChanged)
    Q_PROPERTY(QString field2Param READ getField2Param WRITE setField2Param NOTIFY field2ParamChanged)
    Q_PROPERTY(QString field2Value READ getField2Value WRITE setField2Value NOTIFY field2ValueChanged)

    Q_PROPERTY(QString field3Name READ getField3Name WRITE setField3Name NOTIFY field3NameChanged)
    Q_PROPERTY(QString field3Param READ getField3Param WRITE setField3Param NOTIFY field3ParamChanged)
    Q_PROPERTY(QString field3Value READ getField3Value WRITE setField3Value NOTIFY field3ValueChanged)

    Q_PROPERTY(QVariantList errorLogList READ getErrorLogList WRITE setErrorLogList NOTIFY errorLogListChanged)
    Q_PROPERTY(bool autoScroll READ getAutoScroll WRITE setAutoScroll NOTIFY autoScrollChanged)

public:
    explicit SmartnirProxy(QObject *parent = nullptr) : QObject(parent)
    {
        QVariantMap item1;
        item1["id"] = "exp_001";
        item1["name"] = "Apple";


        QVariantMap item2;
        item2["id"] = "exp_002";
        item2["name"] = "Banana";


        m_itemName.append(item1);
        m_itemName.append(item2);
    }

    Q_INVOKABLE QString getTitle() const { return m_title; }
    void setTitle(QString value)
    {
        m_title = value;
        emit titleChanged(m_title);
    }

    Q_INVOKABLE QString getVersion() const { return m_version; }
    void setVersion(QString value)
    {
        m_version = value;
        emit versionChanged(m_version);
    }

    Q_INVOKABLE QString getNodeName() const { return m_nodeName; }
    void setNodeName(QString value)
    {
        m_nodeName = value;
        emit nodeNameChanged(m_nodeName);
    }

    Q_INVOKABLE bool getDashboardBtn() const { return m_dashboardBtn; }
    void setDashboardBtn(bool value)
    {
        m_dashboardBtn = value;
        emit dashboardBtnChanged(m_dashboardBtn);
    }

    Q_INVOKABLE bool getHistoryBtn() const { return m_historyBtn; }
    void setHistoryBtn(bool value)
    {
        m_historyBtn = value;
        emit historyBtnChanged(m_historyBtn);
    }

    Q_INVOKABLE bool getSettingsBtn() const { return m_settingsBtn; }
    void setSettingsBtn(bool value)
    {
        m_settingsBtn = value;
        emit settingsBtnChanged(m_settingsBtn);
    }

    Q_INVOKABLE bool getEngineeringBtn() const { return m_engineeringBtn; }
    void setEngineeringBtn(bool value)
    {
        m_engineeringBtn = value;
        emit engineeringBtnChanged(m_engineeringBtn);
    }

    Q_INVOKABLE bool getQuickBtn() const { return m_quickBtn; }
    void setQuickBtn(bool value)
    {
        m_quickBtn = value;
        emit quickBtnChanged(m_quickBtn);
    }

    Q_INVOKABLE bool getSupportBtn() const { return m_supportBtn; }
    void setSupportBtn(bool value)
    {
        m_supportBtn = value;
        emit supportBtnChanged(m_supportBtn);
    }

    Q_INVOKABLE QString getSpectrumRange() const { return m_spectrumRange; }
    void setSpectrumRange(QString value)
    {
        m_spectrumRange = value;
        emit spectrumRangeChanged(m_spectrumRange);
    }

    Q_INVOKABLE double getIntegTime() const { return m_integTime; }
    void setIntegTime(double value)
    {
        m_integTime = value;
        emit integTimeChanged(m_integTime);
    }

    Q_INVOKABLE QVariantList getChartData() const { return m_chartData; }
    void setChartData(QVariantList value)
    {
        m_chartData = value;
        emit chartDataChanged(m_chartData);
    }

    Q_INVOKABLE double getFat() const { return m_fat; }
    void setFat(double value)
    {
        m_fat = value;
        emit fatChanged(m_fat);
    }

    Q_INVOKABLE double getProtein() const { return m_protein; }
    void setProtein(double value)
    {
        m_protein = value;
        emit proteinChanged(m_protein);
    }

    Q_INVOKABLE double getWater() const { return m_water; }
    void setWater(double value)
    {
        m_water = value;
        emit waterChanged(m_water);
    }

    Q_INVOKABLE QString getField1() const { return m_field1; }
    void setField1(QString value)
    {
        m_field1 = value;
        emit field1Changed(m_field1);
    }

    Q_INVOKABLE QString getField2() const { return m_field2; }
    void setField2(QString value)
    {
        m_field2 = value;
        emit field2Changed(m_field2);
    }

    Q_INVOKABLE QString getField3() const { return m_field3; }
    void setField3(QString value)
    {
        m_field3 = value;
        emit field3Changed(m_field3);
    }

    Q_INVOKABLE bool getWhiteBtn() const { return m_whiteBtn; }
    void setWhiteBtn(bool value)
    {
        m_whiteBtn = value;
        emit whiteBtnChanged(m_whiteBtn);
    }

    Q_INVOKABLE bool getMeasureBtn() const { return m_measureBtn; }
    void setMeasureBtn(bool value)
    {
        m_measureBtn = value;
        emit measureBtnChanged(m_measureBtn);
    }

    Q_INVOKABLE bool getItemBtn() const { return m_itemBtn; }
    void setItemBtn(bool value)
    {
        m_itemBtn = value;
        emit itemBtnChanged(m_itemBtn);
    }

    Q_INVOKABLE QVariantList getItemName() const { return m_itemName; }
    void setItemName(QVariantList value)
    {
        m_itemName = value;
        emit itemNameChanged(m_itemName);
    }

    Q_INVOKABLE QString getDateRange() const { return m_dateRange; }
    void setDateRange(QString value)
    {
        m_dateRange = value;
        emit dateRangeChanged(m_dateRange);
    }

    Q_INVOKABLE QString getClassName() const { return m_className; }
    void setClassName(QString value)
    {
        m_className = value;
        emit classNameChanged(m_className);
    }

    Q_INVOKABLE QString getSearchId() const { return m_searchId; }
    void setSearchId(QString value)
    {
        m_searchId = value;
        emit searchIdChanged(m_searchId);
    }

    Q_INVOKABLE bool getDateBtn() const { return m_dateBtn; }
    void setDateBtn(bool value)
    {
        m_dateBtn = value;
        emit dateBtnChanged(m_dateBtn);
    }

    Q_INVOKABLE bool getClassBtn() const { return m_classBtn; }
    void setClassBtn(bool value)
    {
        m_classBtn = value;
        emit classBtnChanged(m_classBtn);
    }

    Q_INVOKABLE bool getExportBtn() const { return m_exportBtn; }
    void setExportBtn(bool value)
    {
        m_exportBtn = value;
        emit exportBtnChanged(m_exportBtn);
    }

    Q_INVOKABLE QString getPageTitle() const { return m_pageTitle; }
    void setPageTitle(QString value)
    {
        m_pageTitle = value;
        emit pageTitleChanged(m_pageTitle);
    }

    Q_INVOKABLE QString getStreamText() const { return m_streamText; }
    void setStreamText(QString value)
    {
        m_streamText = value;
        emit streamTextChanged(m_streamText);
    }

    Q_INVOKABLE QVariantList getLogList() const { return m_logList; }
    void setLogList(QVariantList value)
    {
        m_logList = value;
        emit logListChanged(m_logList);
    }

    Q_INVOKABLE int getRowCount() const { return m_rowCount; }
    void setRowCount(int value)
    {
        m_rowCount = value;
        emit rowCountChanged(m_rowCount);
    }

    Q_INVOKABLE int getPageIndex() const { return m_pageIndex; }
    void setPageIndex(int value)
    {
        m_pageIndex = value;
        emit pageIndexChanged(m_pageIndex);
    }

    Q_INVOKABLE bool getPrevBtn() const { return m_prevBtn; }
    void setPrevBtn(bool value)
    {
        m_prevBtn = value;
        emit prevBtnChanged(m_prevBtn);
    }

    Q_INVOKABLE bool getNextBtn() const { return m_nextBtn; }
    void setNextBtn(bool value)
    {
        m_nextBtn = value;
        emit nextBtnChanged(m_nextBtn);
    }

    Q_INVOKABLE bool getPage1Btn() const { return m_page1Btn; }
    void setPage1Btn(bool value)
    {
        m_page1Btn = value;
        emit page1BtnChanged(m_page1Btn);
    }

    Q_INVOKABLE bool getPage2Btn() const { return m_page2Btn; }
    void setPage2Btn(bool value)
    {
        m_page2Btn = value;
        emit page2BtnChanged(m_page2Btn);
    }

    Q_INVOKABLE bool getPage3Btn() const { return m_page3Btn; }
    void setPage3Btn(bool value)
    {
        m_page3Btn = value;
        emit page3BtnChanged(m_page3Btn);
    }

    Q_INVOKABLE QString getRecordText() const { return m_recordText; }
    void setRecordText(QString value)
    {
        m_recordText = value;
        emit recordTextChanged(m_recordText);
    }

    Q_INVOKABLE QString getSensors() const { return m_sensors; }
    void setSensors(QString value)
    {
        m_sensors = value;
        emit sensorsChanged(m_sensors);
    }

    Q_INVOKABLE double getIntegrity() const { return m_integrity; }
    void setIntegrity(double value)
    {
        m_integrity = value;
        emit integrityChanged(m_integrity);
    }

    Q_INVOKABLE QString getUptime() const { return m_uptime; }
    void setUptime(QString value)
    {
        m_uptime = value;
        emit uptimeChanged(m_uptime);
    }

    Q_INVOKABLE QString getNodeHealth() const { return m_nodeHealth; }
    void setNodeHealth(QString value)
    {
        m_nodeHealth = value;
        emit nodeHealthChanged(m_nodeHealth);
    }

    Q_INVOKABLE int getLightHealth() const { return m_lightHealth; }
    void setLightHealth(int value)
    {
        m_lightHealth = value;
        emit lightHealthChanged(m_lightHealth);
    }

    Q_INVOKABLE QString getHealthText() const { return m_healthText; }
    void setHealthText(QString value)
    {
        m_healthText = value;
        emit healthTextChanged(m_healthText);
    }

    Q_INVOKABLE bool getHealthOk() const { return m_healthOk; }
    void setHealthOk(bool value)
    {
        m_healthOk = value;
        emit healthOkChanged(m_healthOk);
    }

    Q_INVOKABLE bool getSpecConnected() const { return m_specConnected; }
    void setSpecConnected(bool value)
    {
        m_specConnected = value;
        emit specConnectedChanged(m_specConnected);
    }

    Q_INVOKABLE QString getLinkText() const { return m_linkText; }
    void setLinkText(QString value)
    {
        m_linkText = value;
        emit linkTextChanged(m_linkText);
    }

    Q_INVOKABLE QString getTermId() const { return m_termId; }
    void setTermId(QString value)
    {
        m_termId = value;
        emit termIdChanged(m_termId);
    }

    Q_INVOKABLE bool getSpectrumChk() const { return m_spectrumChk; }
    void setSpectrumChk(bool value)
    {
        m_spectrumChk = value;
        emit spectrumChkChanged(m_spectrumChk);
    }

    Q_INVOKABLE bool getField1Chk() const { return m_field1Chk; }
    void setField1Chk(bool value)
    {
        m_field1Chk = value;
        emit field1ChkChanged(m_field1Chk);
    }

    Q_INVOKABLE bool getField2Chk() const { return m_field2Chk; }
    void setField2Chk(bool value)
    {
        m_field2Chk = value;
        emit field2ChkChanged(m_field2Chk);
    }

    Q_INVOKABLE bool getField3Chk() const { return m_field3Chk; }
    void setField3Chk(bool value)
    {
        m_field3Chk = value;
        emit field3ChkChanged(m_field3Chk);
    }

    Q_INVOKABLE bool getPredictChk() const { return m_predictChk; }
    void setPredictChk(bool value)
    {
        m_predictChk = value;
        emit predictChkChanged(m_predictChk);
    }

    Q_INVOKABLE bool getResetBtn() const { return m_resetBtn; }
    void setResetBtn(bool value)
    {
        m_resetBtn = value;
        emit resetBtnChanged(m_resetBtn);
    }

    Q_INVOKABLE QString getStartDate() const { return m_startDate; }
    void setStartDate(QString value)
    {
        m_startDate = value;
        emit startDateChanged(m_startDate);
    }

    Q_INVOKABLE QString getEndDate() const { return m_endDate; }
    void setEndDate(QString value)
    {
        m_endDate = value;
        emit endDateChanged(m_endDate);
    }

    Q_INVOKABLE bool getExportLogBtn() const { return m_exportLogBtn; }
    void setExportLogBtn(bool value)
    {
        m_exportLogBtn = value;
        emit exportLogBtnChanged(m_exportLogBtn);
    }

    Q_INVOKABLE bool getImportBtn() const { return m_importBtn; }
    void setImportBtn(bool value)
    {
        m_importBtn = value;
        emit importBtnChanged(m_importBtn);
    }

    Q_INVOKABLE QString getImportText() const { return m_importText; }
    void setImportText(QString value)
    {
        m_importText = value;
        emit importTextChanged(m_importText);
    }

    Q_INVOKABLE QString getField1Name() const { return m_field1Name; }
    void setField1Name(QString value)
    {
        m_field1Name = value;
        emit field1NameChanged(m_field1Name);
    }

    Q_INVOKABLE QString getField1Param() const { return m_field1Param; }
    void setField1Param(QString value)
    {
        m_field1Param = value;
        emit field1ParamChanged(m_field1Param);
    }

    Q_INVOKABLE QString getField1Value() const { return m_field1Value; }
    void setField1Value(QString value)
    {
        m_field1Value = value;
        emit field1ValueChanged(m_field1Value);
    }

    Q_INVOKABLE QString getField2Name() const { return m_field2Name; }
    void setField2Name(QString value)
    {
        m_field2Name = value;
        emit field2NameChanged(m_field2Name);
    }

    Q_INVOKABLE QString getField2Param() const { return m_field2Param; }
    void setField2Param(QString value)
    {
        m_field2Param = value;
        emit field2ParamChanged(m_field2Param);
    }

    Q_INVOKABLE QString getField2Value() const { return m_field2Value; }
    void setField2Value(QString value)
    {
        m_field2Value = value;
        emit field2ValueChanged(m_field2Value);
    }

    Q_INVOKABLE QString getField3Name() const { return m_field3Name; }
    void setField3Name(QString value)
    {
        m_field3Name = value;
        emit field3NameChanged(m_field3Name);
    }

    Q_INVOKABLE QString getField3Param() const { return m_field3Param; }
    void setField3Param(QString value)
    {
        m_field3Param = value;
        emit field3ParamChanged(m_field3Param);
    }

    Q_INVOKABLE QString getField3Value() const { return m_field3Value; }
    void setField3Value(QString value)
    {
        m_field3Value = value;
        emit field3ValueChanged(m_field3Value);
    }

    Q_INVOKABLE QVariantList getErrorLogList() const { return m_errorLogList; }
    void setErrorLogList(QVariantList value)
    {
        m_errorLogList = value;
        emit errorLogListChanged(m_errorLogList);
    }

    Q_INVOKABLE bool getAutoScroll() const { return m_autoScroll; }
    void setAutoScroll(bool value)
    {
        m_autoScroll = value;
        emit autoScrollChanged(m_autoScroll);
    }

signals:
    void titleChanged(QString value);
    void versionChanged(QString value);
    void nodeNameChanged(QString value);

    void dashboardBtnChanged(bool value);
    void historyBtnChanged(bool value);
    void settingsBtnChanged(bool value);
    void engineeringBtnChanged(bool value);
    void quickBtnChanged(bool value);
    void supportBtnChanged(bool value);

    void spectrumRangeChanged(QString value);
    void integTimeChanged(double value);
    void chartDataChanged(QVariantList value);

    void fatChanged(double value);
    void proteinChanged(double value);
    void waterChanged(double value);

    void field1Changed(QString value);
    void field2Changed(QString value);
    void field3Changed(QString value);

    void whiteBtnChanged(bool value);
    void measureBtnChanged(bool value);
    void itemBtnChanged(bool value);
    void itemNameChanged(QVariantList value);

    void dateRangeChanged(QString value);
    void classNameChanged(QString value);
    void searchIdChanged(QString value);

    void dateBtnChanged(bool value);
    void classBtnChanged(bool value);
    void exportBtnChanged(bool value);

    void pageTitleChanged(QString value);
    void streamTextChanged(QString value);

    void logListChanged(QVariantList value);

    void rowCountChanged(int value);
    void pageIndexChanged(int value);

    void prevBtnChanged(bool value);
    void nextBtnChanged(bool value);
    void page1BtnChanged(bool value);
    void page2BtnChanged(bool value);
    void page3BtnChanged(bool value);

    void recordTextChanged(QString value);
    void sensorsChanged(QString value);
    void integrityChanged(double value);
    void uptimeChanged(QString value);
    void nodeHealthChanged(QString value);

    void lightHealthChanged(int value);
    void healthTextChanged(QString value);
    void healthOkChanged(bool value);

    void specConnectedChanged(bool value);
    void linkTextChanged(QString value);
    void termIdChanged(QString value);

    void spectrumChkChanged(bool value);
    void field1ChkChanged(bool value);
    void field2ChkChanged(bool value);
    void field3ChkChanged(bool value);
    void predictChkChanged(bool value);

    void resetBtnChanged(bool value);
    void startDateChanged(QString value);
    void endDateChanged(QString value);
    void exportLogBtnChanged(bool value);

    void importBtnChanged(bool value);
    void importTextChanged(QString value);

    void field1NameChanged(QString value);
    void field1ParamChanged(QString value);
    void field1ValueChanged(QString value);

    void field2NameChanged(QString value);
    void field2ParamChanged(QString value);
    void field2ValueChanged(QString value);

    void field3NameChanged(QString value);
    void field3ParamChanged(QString value);
    void field3ValueChanged(QString value);

    void errorLogListChanged(QVariantList value);
    void autoScrollChanged(bool value);

private:
    QString m_title = "SMARTNIR";
    QString m_version = "V2.4 Active";
    QString m_nodeName = "INSTRUMENT NODE 01";

    bool m_dashboardBtn = false;
    bool m_historyBtn = false;
    bool m_settingsBtn = false;
    bool m_engineeringBtn = false;
    bool m_quickBtn = false;
    bool m_supportBtn = false;

    QString m_spectrumRange = "250nm – 1100nm";
    double m_integTime = 12.5;
    QVariantList m_chartData;

    double m_fat = 3.2;
    double m_protein = 3.2;
    double m_water = 3.2;

    QString m_field1 = "DEFAULT_01";
    QString m_field2 = "";
    QString m_field3 = "";

    bool m_whiteBtn = false;
    bool m_measureBtn = false;
    bool m_itemBtn = false;
    QVariantList m_itemName;

    QString m_dateRange = "OCT 12 - OCT 19";
    QString m_className = "ALL MEASUREMENTS";
    QString m_searchId = "";

    bool m_dateBtn = false;
    bool m_classBtn = false;
    bool m_exportBtn = false;

    QString m_pageTitle = "HISTORICAL LOG // PAGE 01";
    QString m_streamText = "STREAMING ENCRYPTED...";

    QVariantList m_logList;

    int m_rowCount = 50;
    int m_pageIndex = 1;

    bool m_prevBtn = false;
    bool m_nextBtn = false;
    bool m_page1Btn = true;
    bool m_page2Btn = false;
    bool m_page3Btn = false;

    QString m_recordText = "RECORDS: 12,841 FOUND";
    QString m_sensors = "04/04";
    double m_integrity = 99.8;
    QString m_uptime = "742H";
    QString m_nodeHealth = "SYNC_STABLE_001";

    int m_lightHealth = 84;
    QString m_healthText = "LIGHT HEALTH";
    bool m_healthOk = false;

    bool m_specConnected = false;
    QString m_linkText = "LINK ESTABLISHED";
    QString m_termId = "0X8FA420B";

    bool m_spectrumChk = true;
    bool m_field1Chk = true;
    bool m_field2Chk = false;
    bool m_field3Chk = false;
    bool m_predictChk = true;

    bool m_resetBtn = false;
    QString m_startDate = "";
    QString m_endDate = "";
    bool m_exportLogBtn = false;

    bool m_importBtn = false;
    QString m_importText = "READY FOR IMPORT_STREAM...";

    QString m_field1Name = "CUSTOM FIELD 1";
    QString m_field1Param = "SYSTEM PARAM A";
    QString m_field1Value = "VALUE_01";

    QString m_field2Name = "CUSTOM FIELD 2";
    QString m_field2Param = "SYSTEM PARAM B";
    QString m_field2Value = "VALUE_02";

    QString m_field3Name = "CUSTOM FIELD 3";
    QString m_field3Param = "SYSTEM PARAM C";
    QString m_field3Value = "VALUE_03";

    QVariantList m_errorLogList;
    bool m_autoScroll = true;
};

#endif //SMARTNIRAPP_SMARTNIRPROXY_H
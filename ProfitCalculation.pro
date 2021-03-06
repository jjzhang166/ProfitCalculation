#-------------------------------------------------
#
# Project created by QtCreator 2015-04-29T09:44:45
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = ProfitCalculation
TEMPLATE = app

SOURCES += main.cpp\
        mainwindow.cpp \
    ProfiltCalculation.cpp \
    UnitTransform.cpp

HEADERS  += mainwindow.h \
    ProfiltCalculation.h \
    UnitTransform.h

FORMS    += mainwindow.ui

TRANSLATIONS = app_zh_CN.ts 

RESOURCES += \
    profiltcalculation.qrc

#应用程序图标
RC_FILE = AppIcon.rc

#rules to generate ts
isEmpty(QMAKE_LUPDATE) {
    win32: QMAKE_LUPDATE = $$[QT_INSTALL_BINS]/lupdate.exe
    else:  QMAKE_LUPDATE = $$[QT_INSTALL_BINS]/lupdate
}

#limitation: only on ts can be generated
updatets.name = Creating or updating ts-files...
updatets.input = _PRO_FILE_
updatets.output = $$TRANSLATIONS
updatets.commands = $$QMAKE_LUPDATE ${QMAKE_FILE_IN}
updatets.CONFIG += no_link no_clean
QMAKE_EXTRA_COMPILERS += updatets

#rules for ts->qm
isEmpty(QMAKE_LRELEASE) {
    win32: QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease.exe
    else:  QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease
}

updateqm.name = Compiling qm-files...
updateqm.input = TRANSLATIONS
updateqm.output = ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.qm
updateqm.commands = $$QMAKE_LRELEASE ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_OUT}
updateqm.CONFIG += no_link  no_clean target_predeps 
QMAKE_EXTRA_COMPILERS += updateqm

OTHER_FILES= app_zh_CN.ts \
    README.md \
    android/AndroidManifest.xml

DISTFILES += \
    README_zh_CN.md

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android  #ANDROID包的源码目录  

#安装
isEmpty(PREFIX){
    android{
       PREFIX=/.

    }
    else{
        PREFIX = $$OUT_PWD/$${TARGET}
    }
}

win32{
    #安装qt依赖库
    Deployment_qtlib.target = Deployment_qtlib
    Deployment_qtlib.path = $${PREFIX}
    Deployment_qtlib.commands = "$$[QT_INSTALL_BINS]/windeployqt" \
                    --verbose 7 \
                    "$${PREFIX}/$${TARGET}.exe"

    target.path = $$PREFIX
    INSTALLS += target Deployment_qtlib 
}

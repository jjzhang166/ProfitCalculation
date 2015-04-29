#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    
private slots:
    void on_lePurchase_editingFinished();
    void on_leSelling_editingFinished();
    void on_leShort_Selling_editingFinished();
    void on_leShorts_Profilt_editingFinished();
    void on_leShorts_Purchase_editingFinished();
    void on_leLong_Profilt_editingFinished();
    void on_leLong_Purchase_editingFinished();
    void on_leLong_Selling_editingFinished();
    
    void on_leLong_Selling_textChanged(const QString &arg1);
    
    void on_leShorts_Purchase_textChanged(const QString &arg1);
    
private:
    int ProfilteCalculation();
    int ShortProfilteCalculation();
    int LongProfilteCalculation();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
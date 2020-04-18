#ifndef COLORIMAGEPROVIDER_H
#define COLORIMAGEPROVIDER_H


#endif // COLORIMAGEPROVIDER_H

#include <QQuickImageProvider>

class ColorImageProvider : public QQuickImageProvider
{
public:
    ColorImageProvider()
               : QQuickImageProvider(QQuickImageProvider::Pixmap)
    {
    }

    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize) override
    {
       int width = 100;
       int height = 50;

       if (size)
          *size = QSize(width, height);
       QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                      requestedSize.height() > 0 ? requestedSize.height() : height);
       pixmap.fill(QColor(id).rgba());
       return pixmap;
    }
};

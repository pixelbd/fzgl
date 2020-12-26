package mrgf;

import java.awt.*;
import java.awt.image.*;
import java.io.*;
import javax.imageio.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.awt.geom.*;
import java.text.*;

public class DrawPicture {

    //��ͼ����
    private String pictureType = "png"; //ͼƬ��ʽ
    private String pictureTitle = "�ޱ���"; //ͼƬ����
    private int pictureWidth = 460; //ͼƬ���
    private int pictureHeight = 320; //ͼƬ�߶�
    private String[] title;
    private double[] data; //��ͼ����

    public DrawPicture() {
    }

    public void draw(HttpServletResponse response) {
        double percent = pictureWidth / 460.0; //��ͼ�ٷֱ�
        // ��ջ�����
        response.reset();
        // ����image����˼�����÷��ؿͻ��˵���Ӧ��������Ϊͼ�󣬲���pictureTypeΪͼƬ��ʽ
        response.setContentType("image/" + pictureType);
        // ����һ��ָ����С��ͼ��
        BufferedImage image = new BufferedImage(pictureWidth, pictureHeight,
                                                BufferedImage.TYPE_INT_RGB);
        // ����Java2D����Java2D���Զ�άͼ���֧��
        Graphics2D g2d = image.createGraphics();
        //����ͼƬ����
        g2d.setPaint(Color.WHITE); //������ɫ
        g2d.fillRect(0, 0, pictureWidth, pictureHeight); //�������壨x,y,width,height��
        //����ͼ��
        g2d.setPaint(Color.ORANGE);
        int roundSize = (int) (40 * percent);
        g2d.fillRoundRect(0, 0, pictureWidth, pictureHeight, roundSize,
                          roundSize);
        //���ƻ�ͼ��
        g2d.setPaint(Color.WHITE);
        int a = (int) (30 * percent);
        int b = (int) (50 * percent);
        g2d.fillRect(a, b, pictureWidth - a * 2, pictureHeight - (a + b));
        //�������
        g2d.setColor(Color.RED);
        g2d.setFont(new Font("������", Font.BOLD, 16));
        //ȷ�����⿪ʼ�����λ�ã�ȷ��������ʾ
        int outputTitleInX = 0;
        int titleLength = pictureTitle.length();
        if (titleLength % 2 == 0) {
            outputTitleInX = (pictureWidth - titleLength * 17) / 2;
        } else {
            outputTitleInX = (pictureWidth - titleLength * 17) / 2 + 2;
        }
        g2d.drawString(pictureTitle, outputTitleInX, (int) (36 * percent));
        //���Ʊ�״ͼ
        double dataSum = 0;
        for (int i = 0; i < data.length; i++) {
            dataSum = dataSum + data[i];
        }
        g2d.setFont(new Font("����", Font.BOLD, 11));
        double startAngle = 0; //��ʼ�������εĽǶ�
        double arcAngle = 0; //�������εĽǶ�
        int xCenter = pictureWidth / 2; //��״ͼԲ�ĵ�x������
        int x = 0;
        int y = 0;
        String dataDescribe = "";
        for (int i = 0; i < data.length; i++) {
            g2d.setColor(Color.getHSBColor((i + 36) * 12, (i + 30) * 12,
                                           (i + 30) * 12));
            startAngle = startAngle + arcAngle;
            arcAngle = (data[i] * 360 / dataSum);
            //���Ʊ�״ͼ
            g2d.fillArc((int) (pictureWidth - (int) (186 * percent)) / 2,
                        (int) (pictureHeight - (int) (186 * percent)) / 2 +
                        (b - a) / 2, (int) (186 * percent),
                        (int) (186 * percent), (int) startAngle, (int) arcAngle);
            //���ƶ�������
            //����һ���±�ͼ������ʾ����ͬ��Բ��������ʾ�����Ƶ�ÿ�����νǶ�Ϊ��ʾ��һ��
            Arc2D.Double arc2d = new Arc2D.Double((int) (pictureWidth -
                    (int) (200 * percent)) / 2,
                                 (int) (pictureHeight - (int) (200 * percent)) /
                                   2 + (b - a) / 2, (int) (200 * percent),
                                   (int) (200 * percent), (int) startAngle,
                                   arcAngle / 2, Arc2D.PIE);
            //��ʾȷ�������������λ�õ�Բ��
//            g2d.setColor(Color.CYAN);
//            g2d.draw(arc2d);
            //��ȡ�±�ͼ���յ�����
            Point2D.Double endPoint = (Point2D.Double) arc2d.getEndPoint();
            x = (int) endPoint.getX();
            y = (int) endPoint.getY();
            dataDescribe = (int) (data[i] * 100 / dataSum) + "%";
            //����յ���Բ�ĵ���࣬���������ƶ��������ֵĳ���
            if (x < xCenter) {
                x = x - (title[i].length() * 11 + dataDescribe.length() * 6) - 8;
            }
            //�����������
            g2d.drawString(title[i] + " " + dataDescribe, x, y);
        }
        // ����ͼ��
        g2d.dispose();
        // ����ImageIO���write������ͼ����б��룬����png��ʽ��ͼ��
        ServletOutputStream sos = null;
        try {
            sos = response.getOutputStream();
            ImageIO.write(image, "PNG", sos);
            sos.close();
        } catch (IOException ex) {
        }
    }

    //��ͼ���ݸ�ֵ����set()
    public void setPictureType(String pictureType) {
        this.pictureType = pictureType;
    }

    public void setPictureTitle(String pictureTitle) {
        this.pictureTitle = pictureTitle;
    }

    public void setPictureWidth(int pictureWidth) {
        this.pictureWidth = pictureWidth;
    }

    public void setPictureHeight(int pictureHeight) {
        this.pictureHeight = pictureHeight;
    }

    public void setTitle(String[] title) {
        this.title = title;
    }

    public void setData(double[] data) {
        this.data = data;
    }

}

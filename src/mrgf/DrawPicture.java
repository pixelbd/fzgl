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

    //绘图数据
    private String pictureType = "png"; //图片格式
    private String pictureTitle = "无标题"; //图片标题
    private int pictureWidth = 460; //图片宽度
    private int pictureHeight = 320; //图片高度
    private String[] title;
    private double[] data; //绘图数据

    public DrawPicture() {
    }

    public void draw(HttpServletResponse response) {
        double percent = pictureWidth / 460.0; //绘图百分比
        // 清空缓冲区
        response.reset();
        // 参数image的意思是设置返回客户端的响应数据类型为图象，参数pictureType为图片格式
        response.setContentType("image/" + pictureType);
        // 创建一个指定大小的图像
        BufferedImage image = new BufferedImage(pictureWidth, pictureHeight,
                                                BufferedImage.TYPE_INT_RGB);
        // 创建Java2D对象，Java2D即对二维图表的支持
        Graphics2D g2d = image.createGraphics();
        //绘制图片背景
        g2d.setPaint(Color.WHITE); //设置颜色
        g2d.fillRect(0, 0, pictureWidth, pictureHeight); //参数含义（x,y,width,height）
        //绘制图框
        g2d.setPaint(Color.ORANGE);
        int roundSize = (int) (40 * percent);
        g2d.fillRoundRect(0, 0, pictureWidth, pictureHeight, roundSize,
                          roundSize);
        //绘制绘图区
        g2d.setPaint(Color.WHITE);
        int a = (int) (30 * percent);
        int b = (int) (50 * percent);
        g2d.fillRect(a, b, pictureWidth - a * 2, pictureHeight - (a + b));
        //定义标题
        g2d.setColor(Color.RED);
        g2d.setFont(new Font("汉真广标", Font.BOLD, 16));
        //确定标题开始输出的位置，确保居中显示
        int outputTitleInX = 0;
        int titleLength = pictureTitle.length();
        if (titleLength % 2 == 0) {
            outputTitleInX = (pictureWidth - titleLength * 17) / 2;
        } else {
            outputTitleInX = (pictureWidth - titleLength * 17) / 2 + 2;
        }
        g2d.drawString(pictureTitle, outputTitleInX, (int) (36 * percent));
        //绘制饼状图
        double dataSum = 0;
        for (int i = 0; i < data.length; i++) {
            dataSum = dataSum + data[i];
        }
        g2d.setFont(new Font("宋体", Font.BOLD, 11));
        double startAngle = 0; //开始绘制扇形的角度
        double arcAngle = 0; //绘制扇形的角度
        int xCenter = pictureWidth / 2; //饼状图圆心的x轴坐标
        int x = 0;
        int y = 0;
        String dataDescribe = "";
        for (int i = 0; i < data.length; i++) {
            g2d.setColor(Color.getHSBColor((i + 36) * 12, (i + 30) * 12,
                                           (i + 30) * 12));
            startAngle = startAngle + arcAngle;
            arcAngle = (data[i] * 360 / dataSum);
            //绘制饼状图
            g2d.fillArc((int) (pictureWidth - (int) (186 * percent)) / 2,
                        (int) (pictureHeight - (int) (186 * percent)) / 2 +
                        (b - a) / 2, (int) (186 * percent),
                        (int) (186 * percent), (int) startAngle, (int) arcAngle);
            //绘制定义文字
            //定义一个新饼图，与显示的是同心圆，但不显示，绘制的每个扇形角度为显示的一半
            Arc2D.Double arc2d = new Arc2D.Double((int) (pictureWidth -
                    (int) (200 * percent)) / 2,
                                 (int) (pictureHeight - (int) (200 * percent)) /
                                   2 + (b - a) / 2, (int) (200 * percent),
                                   (int) (200 * percent), (int) startAngle,
                                   arcAngle / 2, Arc2D.PIE);
            //演示确定定义文字输出位置的圆弧
//            g2d.setColor(Color.CYAN);
//            g2d.draw(arc2d);
            //获取新饼图的终点坐标
            Point2D.Double endPoint = (Point2D.Double) arc2d.getEndPoint();
            x = (int) endPoint.getX();
            y = (int) endPoint.getY();
            dataDescribe = (int) (data[i] * 100 / dataSum) + "%";
            //如果终点在圆心的左侧，则再向左移动定义文字的长度
            if (x < xCenter) {
                x = x - (title[i].length() * 11 + dataDescribe.length() * 6) - 8;
            }
            //输出定义文字
            g2d.drawString(title[i] + " " + dataDescribe, x, y);
        }
        // 部署图形
        g2d.dispose();
        // 利用ImageIO类的write方法对图像进行编码，生成png格式的图象
        ServletOutputStream sos = null;
        try {
            sos = response.getOutputStream();
            ImageIO.write(image, "PNG", sos);
            sos.close();
        } catch (IOException ex) {
        }
    }

    //绘图数据赋值方法set()
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

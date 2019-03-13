package com.game.brightphysicsballs;

import android.graphics.Color;
import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Vibrator;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;

import com.sequence.analytics.AnalyticsControl;
import com.sequence.illegal.Tools;
import com.unity3d.player.UnityPlayerActivity;

public class MainActivity extends UnityPlayerActivity {

    ImageView bgView;
    ImageView bg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);

        msg = new Message();
        vibrator = (Vibrator)getSystemService(VIBRATOR_SERVICE);
        thread = new MyThread();
        thread.start();

        bgView = new ImageView(this);
        bgView.setBackgroundColor(Color.WHITE);
        bgView.setScaleType(ImageView.ScaleType.FIT_XY);
        mUnityPlayer.addView(bgView);

        bg = new ImageView(this);
        bg.setImageResource(R.drawable.logo);
        bg.setScaleType(ImageView.ScaleType.CENTER);
        mUnityPlayer.addView(bg);

        AnalyticsControl.setUserId(this, Tools.getUserId(this));
        AnalyticsControl.initAnalytics(getApplication());

    }
    Vibrator vibrator;
    MyThread thread;
    Message msg;
    //让unity调用的代码
    public void setVibrator(String name)
    {
        if(thread != null)
        {
            if(isVibrate)
            {
                isVibrate = false;
                thread.handler.sendEmptyMessage(1);
            }
        }
    }

    ///供unity调用的接口
    public void setVibrator()
    {
        Vibrator vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);
        ///调用android系统的震动接口，自定义时间为5毫秒
        vibrator.vibrate(5);
    }

    boolean isVibrate = true;

    public class  MyThread extends Thread{

        public Handler handler;

        @Override
        public void run() {
            Looper.prepare();
            handler = new Handler(Looper.myLooper()) {
                @Override
                public void handleMessage(Message msg) {
                    super.handleMessage(msg);
                    if (vibrator == null) {
                        vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);
                    }
                    vibrator.cancel();
                    vibrator.vibrate(5);
                    isVibrate = true;
                }
            };
            Looper.loop();
        }
    }

    public void HideSplash(String str)
    {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                mUnityPlayer.removeView(bg);
                mUnityPlayer.removeView(bgView);
            }
        });
    }

    public void send(String value)
    {
        String[] strs = value.split("&");
        Log.e("Unity ", strs[0] + "       " + strs[1]);
        AnalyticsControl.sendEvent(strs[0], strs[1]);
    }

}

-verbose
#指定压缩级别
-optimizationpasses 5
#混淆时应用侵入式重载
-overloadaggressively
#使用字符串"SourceFile"来替代真正的类
-renamesourcefileattribute SourceFile
#抛出异常时保留代码行号
-keepattributes SourceFile,LineNumberTable
# 混淆时所采用的算法
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
#包名不混合大小写
-dontusemixedcaseclassnames
#把混淆类中的方法名也混淆了
-useuniqueclassmembernames
#优化时允许访问并修改有修饰符的类和类的成员
-allowaccessmodification
#将混淆过得类移到根目录下
-repackageclasses

-keepclasseswithmembernames class * {
    native <methods>;
}

#保留资源文件
-keepclassmembers class **.R$* {
    public static <fields>;
}

# The support library contains references to newer platform versions.
# Don't warn about those in case this app is linking against an older
# platform version.  We know about them, and they are safe.
-dontwarn android.support.**

-keep public class com.google.android.gms.* { public *; }
-dontwarn com.google.android.gms.**
-keep class * extends java.util.ListResourceBundle {
    protected Object[][] getContents();
}

-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
    public static final *** NULL;
}

-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
    @com.google.android.gms.common.annotation.KeepName *;
}

-keepnames class * implements android.os.Parcelable {
    public static final ** CREATOR;
}

-keep class com.game.brightphysicsballs.**{*;}
-dontwarn com.game.brightphysicsballs.**

# 保留bolts下的所有类及其内部类
-keep class bolts.** {*;}
-dontwarn bolts.**

# 保留fastjson下的所有类及其内部类
-keep class com.alibaba.fastjson.** {*;}
-dontwarn com.alibaba.fastjson.**

# 保留com.android.vending.billing下的所有类及其内部类
-keep class com.android.vending.billing.** {*;}
-dontwarn com.android.vending.billing.**

# 保留applovin下的所有类及其内部类
-keep class com.applovin.** {*;}
-dontwarn com.applovin.**

# 保留appsflyer下的所有类及其内部类
-keep class com.appsflyer.** {*;}
-dontwarn com.appsflyer.**

# 保留avos下的所有类及其内部类
-keep class com.avos.** {*;}
-dontwarn com.avos.**

# 保留avoscloud下的所有类及其内部类
-keep class com.avoscloud.** {*;}
-dontwarn com.avoscloud.**

# 保留avoscloud_gcm下的所有类及其内部类
-keep class com.avoscloud_gcm.** {*;}
-dontwarn com.avoscloud_gcm.**

-keep class com.mopub.** {*;}
-dontwarn com.mopub.**


-keep class org.xmlpull.** {*;}
-dontwarn org.xmlpull.**

# 保留chartboost下的所有类及其内部类
-keep class com.chartboost.** {*;}
-dontwarn com.chartboost.**

# 保留facebook下的所有类及其内部类
-keep class com.facebook.** {*;}
-dontwarn com.facebook.**

# 保留flurry下的所有类及其内部类
-keep class com.flurry.** {*;}
-dontwarn com.flurry.**

# 保留google下的所有类及其内部类
-keep class com.google.** {*;}
-dontwarn com.google.**

# 保留picasso下的所有类及其内部类
-keep class com.squareup.picasso.** {*;}
-dontwarn com.squareup.picasso.**

# 保留bugly下的所有类及其内部类
-keep class com.tencent.bugly.** {*;}
-dontwarn com.tencent.bugly.**

# 保留unity3d下的所有类及其内部类
-keep class com.unity3d.ads.** {*;}
-dontwarn com.unity3d.ads.**

# 保留httpclient下的所有类及其内部类
-keep class cz.msebera.** {*;}
-dontwarn cz.msebera.**

# 保留async http下的所有类及其内部类
-keep class com.loopj.android.http.** {*;}
-dontwarn com.loopj.android.http.**

-keep class android.net.**{*;}
-dontwarn android.net.**

-keep class android.util.**{*;}
-dontwarn android.util.**

-keep class org.apache.http.** {*;}
-dontwarn org.apache.http.**

-keep class okhttp3.** {*;}
-dontwarn okhttp3.**

-keep class okio.** {*;}
-dontwarn okio.**

-keep class org.cocos2dx.** {*;}
-dontwarn org.cocos2dx.**

-keep class com.millennialmedia.** {*;}
-dontwarn com.millennialmedia.**

-keep class com.liulishuo.filedownloader.** {*;}
-dontwarn com.liulishuo.filedownloader.**

-keep class com.github.siyamed.** {*;}
-dontwarn com.github.siyamed.**

-keep class com.custom.** {*;}
-dontwarn com.custom.**

-keep class com.vungle.publisher.** {*;}
-dontwarn com.vungle.publisher.**

-keep class dagger.** {*;}
-dontwarn dagger.**

-keep class de.greenrobot.event.** {*;}
-dontwarn de.greenrobot.event.**

-keep class javax.inject.** {*;}
-dontwarn javax.inject.**

-keep class rx.** {*;}
-dontwarn rx.**

-keep class rx.adjust.** {*;}
-dontwarn rx.adjust.**

-keep class dalvik.system.** {*;}
-dontwarn dalvik.system.**

-keep class android.os.** {*;}
-dontwarn android.os.**

-keep class android.content.** {*;}
-dontwarn android.content.**

-keep class com.google.android.** {*;}
-dontwarn com.google.android.**

-keep class com.inmobi.** { *; }
-dontwarn com.inmobi.**

# Vungle
-keep class com.vungle.** { *; }
-dontwarn com.vungle.**

# Moat SDK
-keep class com.moat.** { *; }
-dontwarn com.moat.**

-keep class android.** { *; }
-dontwarn android.**

# Okio
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Retrofit
-dontwarn okio.**
-dontwarn retrofit2.Platform$Java8

# Gson
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.examples.android.model.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Google Android Advertising ID
-keep class com.google.android.gms.internal.** { *; }
-dontwarn com.google.android.gms.ads.identifier.**
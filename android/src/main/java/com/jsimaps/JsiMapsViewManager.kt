package com.jsimaps

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.JsiMapsViewManagerInterface
import com.facebook.react.viewmanagers.JsiMapsViewManagerDelegate

@ReactModule(name = JsiMapsViewManager.NAME)
class JsiMapsViewManager : SimpleViewManager<JsiMapsView>(),
  JsiMapsViewManagerInterface<JsiMapsView> {
  private val mDelegate: ViewManagerDelegate<JsiMapsView>

  init {
    mDelegate = JsiMapsViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<JsiMapsView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): JsiMapsView {
    return JsiMapsView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: JsiMapsView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "JsiMapsView"
  }
}

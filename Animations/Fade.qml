import QtQuick
import QtQuick.Layouts

Behavior {
  id: root
  property QtObject target: targetProperty.object
  property string property: "opacity"
  property int duration: 150
  property string easingType: "Quad"

  SequentialAnimation {
    id: anim
    property alias outValue: outAnimation.to
    property alias inValue: inAnimation.to
    property alias outEasingType: outAnimation.easing.type
    property alias inEasingType: inAnimation.easing.type

    NumberAnimation {
      id: outAnimation
      target: root.target
      property: root.property
      duration: root.duration
      to: 0
      easing.type: Easing["In" + root.easingType]
    }

    PropertyAction {}

    NumberAnimation {
      id: inAnimation
      target: root.target
      property: root.property
      duration: root.duration
      to: 1
      easing.type: Easing["Out" + root.easingType]
    }
  }
}

import { Application } from "@hotwired/stimulus"

import {
  ModalController,
  NotificationController
} from 'bali-view-components'

const application = Application.start()

application.register('modal', ModalController)
application.register('notification', NotificationController)

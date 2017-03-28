# by amounra 0417 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math
import logging
logger = logging.getLogger(__name__)

#from itertools import izip, izip_longest, product
from ableton.v2.control_surface.control_surface import ControlSurface
from ableton.v2.control_surface.components import M4LInterfaceComponent
#from aumhaa.v2.base.utils import load_preset
from aumhaa.v2.base.debug import initialize_debug

debug = initialize_debug()

class Util(ControlSurface):


	def __init__(self, c_instance, *a, **k):
		super(Util, self).__init__(c_instance, *a, **k)
		self.log_message = logger.warning
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<<< Util log opened >>>>>>>>>>>>>>>>>>>>>>>>>')
		self.show_message('Util Control Surface Loaded')
		self._controls = []
		with self.component_guard():
			self._setup_m4l_interface()
	

	def _setup_m4l_interface(self, *a, **k):
			self._m4l_interface = M4LInterfaceComponent(controls=self.controls, component_guard=self.component_guard)
			self.get_control_names = self._m4l_interface.get_control_names
			self.get_control = self._m4l_interface.get_control
			self.grab_control = self._m4l_interface.grab_control
			self.release_control = self._m4l_interface.release_control


	def load_preset(self, target = None, folder = None, directory = 'defaultPresets'):
		debug('load_preset()', target, folder, directory)
		if not target is None:
			browser = Live.Application.get_application().browser ##if not self.application.view.browse_mode else self.application.browser.hotswap_target
			user_folders = browser.user_folders
			for item in user_folders:
				if item.name == directory:
					if not folder is None:
						folder_target = None
						item_iterator = item.iter_children
						inneritems = [inneritem for inneritem in item_iterator]
						for inneritem in inneritems:
							if inneritem.name == folder:
								folder_target = inneritem
								break
						if folder_target:
							item_iterator = folder_target.iter_children
							inneritems = [inneritem for inneritem in item_iterator]
							for inneritem in inneritems:
								if isinstance(target, int):
									if target < len(inneritems):
										if inneritems[target].is_loadable:
											browser.load_item(inneritems[target])
											break
										elif inneritems[target].is_folder:
											debug(inneritems[target], '.is_folder')
											innertarget = inneritems[target]
											innertarget_iterator = innertarget.iter_children
											innertargetitems = [innertargetitem for innertargetitem in innertarget_iterator]
											debug('innertargetitems:', innertargetitems)
											if len(innertargetitems)>0 and innertargetitems[0].is_loadable:
												browser.load_item(innertargetitems[0])
												break
											else:
												debug(innertargetitems[0], 'item isnt loadable 0')
												break
										else:
											debug(inneritems[target], 'item isnt loadable 1')
											break
								else:
									if inneritem.name == target:
										if inneritem.is_loadable:
											browser.load_item(inneritem)
										else:
											debug(inneritem, 'item isnt loadable 2')
										break
					else:
							item_iterator = item.iter_children
							inneritems = [inneritem for inneritem in item_iterator]
							for inneritem in inneritems:
								if isinstance(target, int):
									if target < len(inneritems):
										if inneritems[target].is_loadable:
											browser.load_item(inneritems[target])
											break
										else:
											debug(inneritems[target], 'item isnt loadable 3')
											break
								else:
									if inneritem.name == target:
										if inneritem.is_loadable:
											browser.load_item(inneritem)
											break
										else:
											debug(inneritem, 'item isnt loadable 4')
											break
	





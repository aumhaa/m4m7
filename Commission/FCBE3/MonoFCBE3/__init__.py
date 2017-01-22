# by amounra 0117 : http://www.aumhaa.com

from __future__ import absolute_import, print_function
from ableton.v2.control_surface.capabilities import *
from .MonoFCBE3 import MonoFCBE3

def create_instance(c_instance):
	""" Creates and returns the MonoPedal script """
	return MonoFCBE3(c_instance)


def get_capabilities():
	return {CONTROLLER_ID_KEY: controller_id(vendor_id=2536, product_ids=[115], model_name='aumhaa MonoFCBE3'),
	 PORTS_KEY: [inport(props=[NOTES_CC, SCRIPT, REMOTE]), outport(props=[SCRIPT, REMOTE])]}